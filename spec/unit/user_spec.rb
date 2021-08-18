require_relative '../../lib/user.rb'

describe User do
  describe "create method" do
    it "User can create an account and it stores in the database" do
      connection = PG.connect(dbname: 'makersbnb_test')

      User.create(username: "Nazir123", first_name: "Nazir", 
        second_name: "Shaikh", password: "jellySNAKES456", email: "Nazir@gogoanime.com")

      result = connection.exec("SELECT * FROM users;").to_a

      # Index 1 because setup_test_database.rb inserts a test every time rspec runs
      expect(result[1]['username']).to eq('Nazir123')
      expect(result[1]['first_name']).to eq('Nazir')
      expect(result[1]['second_name']).to eq('Shaikh')
      expect(result[1]['password']).to eq('jellySNAKES456')
      expect(result[1]['email']).to eq('Nazir@gogoanime.com')
    end

    it "User cannot create an account when their chosen username already exists" do
      connection = PG.connect(dbname: 'makersbnb_test')

      User.create(username: "Nazir123", first_name: "Nazir", 
        second_name: "Shaikh", password: "jellySNAKES456", email: "Nazir@gogoanime.com")

      expect(User.create(username: "Nazir123", first_name: "Nazir", 
        second_name: "Shaikh", password: "jellySNAKES456", 
        email: "Nazir@gogoanime.com")).to eq('/username_already_exists')
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
  
  describe '#auth' do 
    it 'redirects to the spaces page if username and passwords match' do 
      temp = User.auth(username: 'testlogin1', password:'testpassword1')
      expect(temp).to eq true
    end 


    it 'redirects to the login page if the username and passwords DO NOT match' do 
      temp = User.auth(username: 'testlogin1', password:'WRONGPASSWORD')
      expect(temp).to eq false
    end 
  end
end