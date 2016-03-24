ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
enable :sessions

  before do
    @links = Link.all
  end

  get '/' do
    erb :home
  end

  post '/welcome' do
    Users.create(username: params[:username], email: params[:email], password: 'missing')
    redirect to('/links')
  end

  get '/links' do
    @username = Users.last.username
    erb :"links/index"
  end

  get '/links/new' do
    erb :"links/new"
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
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
