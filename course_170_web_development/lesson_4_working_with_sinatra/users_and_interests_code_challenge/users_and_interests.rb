require 'sinatra'
require 'sinatra/reloader'
require 'erubis'
require 'yaml'

before do
  @users = YAML.load(File.read('users.yaml'))
  @users_overview = count_interests()
end

get "/" do
  redirect "users"
end

get "/users" do
  erb :users
end

get "/users/:name" do
  @name = params['name']
  information = @users[@name.to_sym]
  
  @email = information[:email]
  @interests = information[:interests].join(', ')
  
  erb :user
end

helpers do
  def each_user
    @users.each do |name, information|
      email = information[:email]
      interests = information[:interests]

      yield name, email, interests
    end
  end

  def count_interests
    result = {users: 0, interests: 0}

    each_user do |name, _, interests|
      result[:users] += 1
      result[:interests] += interests.length
    end
    result
  end
end

