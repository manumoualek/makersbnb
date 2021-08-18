require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE users;")
  connection.exec("INSERT INTO users (username, password) values ('testlogin1', 'testpassword1');")
end
