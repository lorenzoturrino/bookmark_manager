ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'bcrypt'

class BookmarkManager < Sinatra::Base
enable :sessions
set :session_secret, 'notsosecret'


  get '/' do
    erb :home
  end

  post '/welcome' do
    if params[:password] == params[:password_confirmation]
      password = BCrypt::Password.create(params[:password])
      user = Users.create(username: params[:username], email: params[:email], password: password.to_s)
      session[:user_id] = user.id
      redirect to('/links')
    else
      redirect to('/try_again')
    end
  end

  get '/try_again' do
    "mismatching password"
  end

  get '/links' do
    user = Users.get(session[:user_id])
    @username = user.username
    @user_id = user.id
    @number_of_users = Users.count
    @email = user.email
    @links = Link.all(users_id: user.id) || []
    erb :"links/index"
  end

  get '/links/new' do
    user = Users.get(session[:user_id])
      @username = user.username
    erb :"links/new"
  end

  post '/links' do
    user = Users.get(session[:user_id])
    link = Link.new(url: params[:url], title: params[:title], users_id: user.id)
    tags = params[:name].gsub(/, /, ',').split(',')
    tags.each{ |tag| link.tags << Tag.create(name: tag) }
    link.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :"links/index"
  end

run! if app_file == $0
end
