require_relative '../../lib/user.rb'

describe "users" do
  describe "create method" do
    it "User can create an account and it stores in the database" do
      connection = PG.connect(dbname: 'makersbnb_test')

      User.create(username: "Nazir123", first_name: "Nazir", second_name: "Shaikh", password: "jellySNAKES456", email: "Nazir@gogoanime.com")

      result = connection.exec("SELECT * FROM users;").to_a

      expect(result[0]['username']).to eq('Nazir123')
      expect(result[0]['first_name']).to eq('Nazir')
      expect(result[0]['second_name']).to eq('Shaikh')
      expect(result[0]['password']).to eq('jellySNAKES456')
      expect(result[0]['email']).to eq('Nazir@gogoanime.com')
    end
  end

  describe "check method" do
    it "returns false if username already exists " do
      connection = PG.connect(dbname: 'makersbnb_test')

      connection.exec("INSERT INTO users 
        (username, first_name, second_name, password, email)
        VALUES ('Dillon', 'Dylan', 
        'Hancock', 'jellyBUBBLES123', 'dylan@gmail.com');"
      )
      expect(User.username_available?(username: 'Dillon')).to eq(false)
    end

    it "returns true if username doesn't already exist" do
      connection = PG.connect(dbname: 'makersbnb_test')
      
      connection.exec("INSERT INTO users 
        (username, first_name, second_name, password, email)
        VALUES ('Dillon', 'Dylan', 
        'Hancock', 'jellyBUBBLES123', 'dylan@gmail.com');"
      )
      expect(User.username_available?(username: 'Peppa')).to eq(true)
    end
  end
end