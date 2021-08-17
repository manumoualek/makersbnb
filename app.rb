require 'sinatra/base'
require_relative 'lib/user.rb'

class Makers_BnB < Sinatra::Base 

  get '/login' do 
    erb :login
  end 

  post '/testinglogin' do 
    p @login = User.auth(username: params[:username], password: params[:password])

    if @login == true
      redirect '/'
    else
      redirect '/login'
    end
  end 

  get '/' do 
   "Welcome back"
  end


  run! if app_file == $0
end