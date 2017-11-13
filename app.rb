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
  @pageuser = User.find_by_id(params[:id])
  @pageuserid = @pageuser.id
  @posts = Post.where(user_id: @pageuserid)
  erb :profile
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/edit' do
  erb :edit
end

get '/postsedit' do
  erb :postsedit
end

get '/users' do
  @users = User.all
  erb :users
end

post '/login' do
  username = params[:username].downcase
  user = User.find_or_create_by(username: username)
  session[:user_id] = user.id
  redirect to '/feed'
end

# creating messages route
post '/posts/:id' do
  @user = User.find_by_id(session[:user_id])
  @user.posts.create(content: params[:content])
  redirect '/feed'
end

# edit a user
patch '/profile/:id' do
  user = User.find_by_id(session[:user_id])
  user.update(
    username: params[:username],
    f_name: params[:f_name],
    l_name: params[:l_name],
    email: params[:email]
  )

  redirect "/profile/#{user.id}"
end

# delete a user
delete '/profile/:id' do
  user = User.find_by_id(params[:id])
  user.destroy
  redirect '/'
end

# edit a post
patch '/posts/:id' do
  @user = User.find_by_id(session[:user_id])
  @user.posts.update(content: params[:content])
  redirect "/profile/#{user.id}"
end
