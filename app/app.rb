ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

class Bookmark < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :'index'
  end

  get '/sign_up' do
    if session[:email].nil?
      erb :'signup'
    else
      @email = session[:email]
      erb :'signup'
    end
  end

  post '/registration' do
    user = User.new(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:confirm_password])
    if user.save
      session[:user_id] = user.id
      redirect '/links'
    else
      flash[:mismatch] ='Password and confirmation password do not match' if params[:password] != params[:confirm_password]
      flash[:missing_email] = 'No email entered' if params[:email].empty?
      flash[:invalid_email] = 'Invalid email entered' if !(params[:email] =~ EMAIL_REGEX)
      session[:email] = params[:email]
      redirect '/sign_up'
    end
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
