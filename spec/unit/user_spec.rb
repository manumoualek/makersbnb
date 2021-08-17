require 'user.rb'

describe User do 
  
  describe '#auth' do 
    it 'redirects to the spaces page if username and passwords match' do 
      temp = User.auth(username: 'testlogin1', password:'testpassword1')
      expect(temp).to eq "/spaces"
      #expect(temp.logged_in).to_be true
    end 


    it 'redirects to the login page if the username and passwords DO NOT match' do 
      temp = User.auth(username: 'testlogin1', password:'WRONGPASSWORD')
      expect(temp).to eq "/login"
    end 
  end 

  describe '#initialize' do
    it 'returns nil when initialized' do 
      temp = User.new
      expect(temp.logged_in).to eq nil
    end 

    it 'returns true when the log in info is correct' do 
      # temp = User.auth(username: 'testlogin1', password:'testpassword1')
      # expect(User).auth(username: 'testlogin1', password:'testpassword1').to eq true
      
    end 

    it 'returns false when log in info is incorrect' do
    end
  end



end 