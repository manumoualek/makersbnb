require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE users, spaces RESTART IDENTITY;") #Everytime the test DB is run here it removes all previous primary keys (for all specified tables) and restarts the primary key counter at 1. This makes testing possible.
  connection.exec("INSERT INTO users (username, password, first_name, second_name, email) values ('testlogin1', 'testpassword1', 'testforename1', 'testsurname1', 'test1@email.com');")
end
