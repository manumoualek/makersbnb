require 'sinatra/base'
require_relative 'lib/user.rb'

class Makers_BnB < Sinatra::Base 

  get '/' do 
    "Sign up page"
   end

  get '/login' do 
    erb :login
  end 

  post '/testinglogin' do 
    @auth_page = User.auth(username: params[:username], password: params[:password])
    redirect @auth_page     #The page it will redirect to is based on whether log in is successful or not.
  end 

  get '/spaces' do
    erb :spaces
  end

  run! if app_file == $0
end