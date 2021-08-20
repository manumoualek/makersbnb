def db_connect 
  if ENV['ENVIRONMENT'] == 'test'
    return connection = PG.connect(dbname: 'makersbnb_test')
  else
    return connection = PG.connect(dbname: 'makersbnb')
  end
end 