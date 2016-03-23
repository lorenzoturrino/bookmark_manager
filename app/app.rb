ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/link.rb'
require './app/models/tag.rb'

require './app/models/data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb(:hello)

  end

  post '/links' do
    link = Link.create(link_address: params[:link_address], link_name: params[:link_name])
    tag = Tag.create(tag_name: params[:tag_name])
    LinkTag.create(:link => link, :tag => tag)
    redirect('/links')
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
