class User

  def self.create(username:, first_name:, second_name:, password:, email:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    
    if self.username_available?(username: username) == false
      raise('Username already exists')
    else
      connection.exec(
      "INSERT INTO users (username, first_name, second_name, password, email)
       VALUES ('#{username}', '#{first_name}', 
      '#{second_name}', '#{password}', '#{email}');"
    )
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
end