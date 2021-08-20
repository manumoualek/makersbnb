require 'pg'

def db_connect 
  if ENV['ENVIRONMENT'] == 'test'
    return PG.connect(dbname: 'makersbnb_test')
  else
    return PG.connect(dbname: 'makersbnb')
  end
end 