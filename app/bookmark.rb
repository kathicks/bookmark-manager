require 'sinatra/base'
require_relative 'models/link.rb'

class Bookmark < Sinatra::Base
  get '/' do
    'Hello Bookmark!'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
