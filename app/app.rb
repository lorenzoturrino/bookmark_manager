ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb(:hello)

  end

  post '/links' do
    Link.create(link_address: params[:link_address], link_name: params[:link_name])
    redirect('/links')
  end

  get '/links' do
    @links = Link.all
    erb(:'links/links')
  end

  get '/links/new' do
    erb(:'links/add_link')
  end

  run! if app_file == $0
end
