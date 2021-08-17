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
    p @login = User.auth(username: params[:username], password: params[:password])

    if @login == true #Can we remove the logic?
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