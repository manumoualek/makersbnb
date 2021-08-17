require 'sinatra/base'
require 'pg'
require_relative './lib/user'

class Makers_BnB < Sinatra::Base 
  
  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    User.create(
      username: params[:username],
      first_name: params[:first_name],
      second_name: params[:second_name],
      password: params[:password],
      email: params[:email])
      # redirect '##########'
  end

  run! if app_file == $0
end