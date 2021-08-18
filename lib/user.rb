require 'pg'

class User

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

