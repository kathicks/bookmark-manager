require 'sinatra/base'
require_relative 'models/link.rb'

class Bookmark < Sinatra::Base
  get '/' do
    'Hello Bookmark!'
  end

  get '/links' do
    Link.create(title: "Google", url: "www.google.com")
    links = Link.all
    @title = links[0].title
    @url = links[0].url
    erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
