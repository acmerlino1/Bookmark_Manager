require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  
  get '/' do
    erb :index
  end
  
  post '/bookmarks/new' do
    Bookmark.create(url: params['url'])
    redirect '/bookmarks'
  end


  get '/bookmarks' do

    @bookmarks = Bookmark.all
    erb :'bookmarks/bookmarks'
  end


  run! if app_file == $0

end 
