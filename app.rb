require 'sinatra/base'

class Makers_BnB < Sinatra::Base 
  
  get '/signup' do
    erb(:signup)
  end

  run! if app_file == $0
end