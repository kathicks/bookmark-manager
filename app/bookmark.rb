require 'sinatra/base'
require_relative 'models/link.rb'

class Bookmark < Sinatra::Base

  ENV["RACK_ENV"] ||= "development"
  # set :environment, :development - different way of setting an environment to default mode

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
