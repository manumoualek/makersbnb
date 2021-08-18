require 'sinatra/base'
require 'pg'
require_relative './lib/user'
require 'sinatra/reloader'    

class Makers_BnB < Sinatra::Base 
  
  enable :sessions
  
  configure :development do
    register Sinatra::Reloader
  end
  
  get '/' do
    erb(:homepage)
  end
  
  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    redirect(User.create(
        username: params[:username],
        first_name: params[:first_name],
        second_name: params[:second_name],
        password: params[:password],
        email: params[:email]))
  end
  
  get '/login' do 
    @logged_in = session[:logged_in]
    erb :login
  end 

  post '/testinglogin' do

    session[:logged_in] = User.auth(username: params[:username], password: params[:password])
    @logged_in = session[:logged_in]
    if @logged_in
      redirect '/spaces'
    else
      redirect '/login'
    end
  end
  
  get '/spaces' do
    erb :spaces
  end
  
  get '/spaces/new' do
    erb :spaces_new
  end

  get '/username_already_exists' do
    erb(:username_already_exists)
  end




  run! if app_file == $0
end