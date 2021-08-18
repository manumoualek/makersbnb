require 'sinatra/base'
require 'pg'
require 'sinatra/reloader'
require_relative './lib/user'
require_relative './lib/space'

class Makers_BnB < Sinatra::Base 
  
  configure :development do
    register Sinatra::Reloader
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

  end

  get '/spaces' do
    erb :spaces
  end

  get '/spaces/new' do
    erb :spaces_new
  end

  post '/spaces/new' do
    Space.create(
      space_name: params['listing_name'],
      space_description: params['listing_description'],
      space_price: params['listing_price_per_night'],
      available_from: params['listing_available_from'],
      available_to: params['listing_available_to']
    )
  end

  get '/username_already_exists' do
    erb(:username_already_exists)
  end

  run! if app_file == $0
end