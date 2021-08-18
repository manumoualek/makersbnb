
require 'pg'

class User

  def self.create(username:, first_name:, second_name:, password:, email:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    
    if self.username_available?(username: username) == false
      return '/username_already_exists'

    else
      connection.exec(
      "INSERT INTO users (username, first_name, second_name, password, email)
       VALUES ('#{username}', '#{first_name}', 
      '#{second_name}', '#{password}', '#{email}');"
    )
      return '/login'

    end
  end

  def self.username_available?(username:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM users WHERE username = '#{username}';").to_a

    if result.length == 0 
      true
    else
      false
    end    
  end
  
  def self.auth(username:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'makersbnb_test')
    else
      con = PG.connect(dbname: 'makersbnb')
    end 

    
     
    login_details = con.exec("SELECT * FROM users WHERE username ='#{username}';").to_a
    if login_details.length == 0
      return false 
    else
      if password == login_details[0]["password"] #This is the format for accessing certain info while using the .to_a
        true
      else
        false
      end   
    end  
  end
end

