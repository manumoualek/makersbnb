require 'sinatra/base'
require 'pg'

class Makers_BnB < Sinatra::Base 
  
  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec(
      "INSERT INTO users (username, first_name, second_name, password, email) VALUES ('#{params[:username]}', '#{params[:first_name]}', '#{params[:second_name]}', '#{params[:password]}', '#{params[:email]}');"
    )
  end

  run! if app_file == $0
end