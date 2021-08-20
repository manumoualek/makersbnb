require_relative '../../lib/request.rb'

describe Request do
  describe "#create" do
    it "should add a request to the database" do
      connection = PG.connect(dbname: 'makersbnb_test')
      
      connection.exec("INSERT INTO users (username, password, first_name, second_name, email) values 
      ('testguest1', 'testguest1', 'testguest1', 'testguest1', 'testguest1@email.com');")

      connection.exec("INSERT INTO spaces (spaceid, space_name, space_description, space_price, available_from, available_to, userid) 
         VALUES ('1', 'Red house', 'Lots of red', 
        '23.00', '2022-05-01', '2022-05-29', '2');")
      
      Request.create(space_id: '1' , check_out: "2022-05-06" , check_in: '2022-05-05' , guest:'2' , host: '1' , approved: 'f')
      result = connection.exec("SELECT * FROM requests;").to_a

      expect(result[0]['space_id']).to eq '1'
      expect(result[0]['check_out']).to eq '2022-05-06'
      expect(result[0]['check_in']).to eq '2022-05-05'
      expect(result[0]['guest']).to eq '2'
      expect(result[0]['host']).to eq '1'
      expect(result[0]['approved']).to eq 'f'
    end  
  end
end