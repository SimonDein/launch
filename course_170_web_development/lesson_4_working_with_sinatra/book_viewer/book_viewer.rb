require 'tilt/erubis'
require "sinatra"
require "sinatra/reloader"

before do
  @contents = File.readlines('data/toc.txt')
end

not_found do
  redirect "/"
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapter/:number" do
  chapter_num = params[:number].to_i
  chapter_title = @contents[chapter_num - 1]

  redirect "/" unless (1..@contents.length) === chapter_num
  
  @title = "Chapter #{chapter_num}: #{chapter_title}"
  @chapter = File.read("data/chp#{params[:number]}.txt")

  erb :chapter
end

get "/search" do
  @query = params[:query]
  @search_result = search(@query) if @query

  erb :search
end

helpers do
  def in_paragraphs(text)
    text.each_line('').map do |line|
      "<p>#{line}</p>"
    end.join()
  end
  
  def search(query)
    result = []

    @contents.each_with_index do |chapter_name, index|
      chapter_number = (index + 1).to_s
      text = File.read('data/chp' + chapter_number + '.txt').downcase

      result << [chapter_name, chapter_number] if text.include?(query)
    end
    result.empty? ? nil : result
  end
end