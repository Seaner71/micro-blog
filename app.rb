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
  erb :feed
end

get '/profile/:id' do
  @user = User.find_by_id(params[:id])
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
