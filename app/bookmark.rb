ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :'index'
  end

  get '/sign_up' do
    erb :'signup'
  end

  post '/registration' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    @user  = current_user
    erb :'links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    params[:tags].split(', ').each do |tag|
      link.tags << Tag.first_or_create(name: tag)
      link.save
    end

    redirect '/links'
  end

  get '/tags/:name' do |n|
    tag_name = n.gsub('_', ' ').split.map(&:capitalize).join(' ')
    @links = Tag.all(name: tag_name ).links
    @user  = current_user
    erb :'links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
