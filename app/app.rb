require 'sinatra/base'
require 'bcrypt'

require './app/models/link.rb'
require './app/models/tag.rb'
require './app/models/user.rb'

ENV['RACK_ENV'] ||= 'development'
require './app/models/data_mapper_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:hello)
  end

  post '/signup' do
    encrypted_pwd = (BCrypt::Password.create params[:reg_pass]).to_s
    user = User.create(username: params[:reg_username] , email: params[:reg_email], password: encrypted_pwd.to_s)
    session[:userid] = user.id
    redirect '/registration_completed'
  end

  post '/login' do
    encrypted_pwd = (BCrypt::Password.create params[:log_pass]).to_s
    tentative_user = User.last(username: params[:log_username])
    if tentative_user.password == encrypted_pwd
      redirect '/registration_completed'
    else
      redirect '/wrong_pwd'
    end
  end

  get '/wrong_pwd' do
    "wrong pwd"
  end

  get '/registration_completed' do
    puts "sid is #{session[:userid]}"
    @username = User.get(session[:userid]).username
    @registered_count = User.count
    erb :registration_completed
  end

  post '/links' do
    tag_array = params[:tag_name].split.map { |tag| Tag.first_or_create( :tag_name => tag ) }
    link = Link.create(link_address: params[:link_address], link_name: params[:link_name], tags: tag_array)
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb(:'links/links')
  end

  get '/links/new' do
    erb(:'links/add_link')
  end

  get '/tags/:name' do
    tag = Tag.first(tag_name: params[:name])
    @links = tag ? tag.links : []
    erb(:'links/links')
  end

  run! if app_file == $0
end
