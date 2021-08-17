require 'sinatra/base'

class Makers_BnB < Sinatra::Base 

  get '/login' do 
    erb :login
  end 



  run! if app_file == $0
end