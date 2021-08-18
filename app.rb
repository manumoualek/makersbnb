require 'sinatra/base'
require_relative 'lib/user.rb'
require 'sinatra/reloader'

class Makers_BnB < Sinatra::Base 
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    "Sign up page"
   end

  get '/login' do 
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

  run! if app_file == $0
end