require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './models'

enable :sessions

# Database configuration
set :database, "sqlite3:development.sqlite3"

def current_user
  @user ||= User.find_by_id(session[:user_id])
end

# Define routes below
get '/' do
  if current_user
    redirect '/feed'
  else
    erb :index
  end
end

get '/feed' do
  @pageuser = User.find_by_id(session[:user_id])
  @posts = Post.all

  erb :feed
end

get '/profile/:id' do
  @pageuser = User.find_by_id(session[:user_id])
  erb :profile
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/edit' do
  erb :edit
end

post '/login' do
  username = params[:username].downcase
  user = User.find_or_create_by(username: username)
  session[:user_id] = user.id
  redirect to '/feed'
end

# creating messages route
post '/posts' do
  message = Post.create(content: params[:content])
  redirect '/feed'
end
