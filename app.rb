require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  
  get '/' do
    erb :index
  end
  
  post '/bookmarks/new' do
    Bookmark.create(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end


  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end


  run! if app_file == $0

end 
