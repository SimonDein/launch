require 'tilt/erubis'
require "sinatra"
require "sinatra/reloader" if development?

configure do
  set :server, :puma
end

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
  @query = params['query']
  @search_result = nil
  @search_result = chapters_matching(@query) if @query

  erb :search
end

helpers do
  def in_paragraphs(text)
    text.each_line('').map.with_index do |line, index|
      "<p id='#{index}'>#{line}</p>"
    end.join()
  end

  # Iterates every chapter - yielding the name, number and text of it.
  def each_chapter
    @contents.each_with_index do |name, index|
      number = (index + 1).to_s
      text = File.read('data/chp' + number + '.txt')
      yield name, number, text
    end
  end
  
  # Returns an array of Hashes.
  # Each hash represents a chapter - containing the name, number and matched paragraphs of that chapter.
  def chapters_matching(query)
    result = []

    each_chapter do |name, number, text|
      if text.downcase.include?(query.downcase)
        matches = {}
        text.each_line('').with_index do |paragraph, paragraph_number|
          matches[:paragraph_number] = paragraph if paragraph.downcase.include?(query.downcase)
        end
        result << {name: name, number: number, paragraphs: matches}
      end
    end
    result
  end
end