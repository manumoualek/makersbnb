require 'pg'

class User
 attr_accessor :logged_in

  def self.initialize
    @logged_in = nil
  end 

  def self.auth(username:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'makersbnb_test')
    else
      con = PG.connect(dbname: 'makersbnb')
    end 
    
    login_details = con.exec("SELECT username, password FROM users WHERE username LIKE('%#{username}%');").to_a

    if password == login_details[0]["password"] #This is the format for accessing certain info while using the .to_a
      @logged_in = true
      newpage = '/spaces'
    else
      @logged_in = false
      newpage = '/login'
    end
  end 

  def logged_in
    return @logged_in
  end 

end 