require 'pg'

class User
 #attr_accessor = 

  def self.intialize
    @login_status = nil
  end 

  def self.auth(username:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'makersbnb_test')
    else
      con = PG.connect(dbname: 'makersbnb')
    end 
    
    p login_details = con.exec("SELECT username, password FROM users WHERE username LIKE('%#{username}%');").to_a
    page = ""
    if password == login_details[0]["password"] #This is the format for accessing certain info while using the .to_a
      @login_status = true
    else
      @login_status = false
    end
  end 

end 