require 'database_connection.rb' #This isn't needed, but I'm too scared to remove it as I'm unsure why it isn't needed.
class User

  def self.create(username:, first_name:, second_name:, password:, email:)
    if self.username_available?(username: username) == false
      return '/username_already_exists'

    else
      db_connect.exec(
      "INSERT INTO users (username, first_name, second_name, password, email)
       VALUES ('#{username}', '#{first_name}', 
      '#{second_name}', '#{password}', '#{email}');"
    )
      return '/login'
    end
  end

  def self.username_available?(username:)
    result = db_connect.exec("SELECT * FROM users WHERE username = '#{username}';").to_a

    if result.length == 0 
      true
    else
      false
    end    
  end
  
  def self.auth(username:, password:)

    login_details = db_connect.exec("SELECT * FROM users WHERE username ='#{username}';").to_a

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

  def self.getID(username:)
    result = db_connect.exec("SELECT userid FROM users WHERE username = '#{username}';").to_a
    result[0]['userid']
    #to_i
  end

  def self.get_username(username:) #This doesn't work, but why!?!?!
    return db_connect.exec("SELECT * FROM users WHERE username ='#{username}';").to_a
  end 


end







