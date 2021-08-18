require 'user.rb'

describe User do 
  
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