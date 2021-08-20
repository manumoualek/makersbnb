require_relative '../../lib/request.rb'

describe Request do
  describe "#create" do
    it "should add a request to the database" do
      connection = PG.connect(dbname: 'makersbnb_test')
      
      connection.exec("INSERT INTO users (username, password, first_name, second_name, email) values 
      ('testguest1', 'testguest1', 'testguest1', 'testguest1', 'testguest1@email.com');")

#       connection.exec("INSERT INTO spaces (spaceid, space_name, space_description, space_price, available_from, available_to, userid) 
#          VALUES ('1', 'Red house', 'Lots of red', '23.00', '2022-05-01', '2022-05-29', '2');")
      
      Request.create(space_id: '1' , check_out: "2022-05-06" , check_in: '2022-05-05' , guest:'2' , host: '1' , approved: 'f')
      result = connection.exec("SELECT * FROM requests;").to_a

      expect(result[0]['space_id']).to eq '1'
      expect(result[0]['check_out']).to eq '2022-05-06'
      expect(result[0]['check_in']).to eq '2022-05-05'
      expect(result[0]['guest']).to eq '2'
      expect(result[0]['host']).to eq '1'
      expect(result[0]['approved']).to eq 'f' 
    end  

    it 'should display all requests for a space I host' do 

      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO users (username, password, first_name, second_name, email) 
                                  values ('testguest1', 'testguest1', 'testguest1', 'testguest1', 'testguest1@email.com');") #This is guest_id 2

      connection.exec("INSERT INTO spaces (space_name, userid, space_description, space_price, available_from, available_to) 
                                values ('testspace2', '1', 'This is the test space2', '99.99', '2022-05-22', '2022-05-22');") #This is space_id 2
      
      Request.create(space_id: '1' , check_out: "2022-05-06" , check_in: '2022-05-05' , guest:'2' , host: '1' , approved: 'f')
      Request.create(space_id: '2' , check_out: "2024-05-06" , check_in: '2024-05-05' , guest:'2' , host: '1' , approved: 'f')

      hosts_requests = Request.host_request(userid: 1)

      expect(hosts_requests.length).to eq 2 #This eliminates the need to check the status of each request, as we have checked the number of requests here is the number added above (2)
      expect(hosts_requests[1]['space_id']).to eq '2' 
      expect(hosts_requests[1]['check_out']).to eq '2024-05-06' 
      expect(hosts_requests[1]['check_in']).to eq '2024-05-05' 
      expect(hosts_requests[1]['guest']).to eq '2' 
      expect(hosts_requests[1]['host']).to eq '1' 
      expect(hosts_requests[1]['approved']).to eq 'f' 
    end

    it "should display all requests we have made to hire other hosts' spaces" do 
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO users (username, password, first_name, second_name, email) 
        values ('testhost1', 'testhost1', 'testhost1', 'testhost1', 'testhost1@email.com');") #This is a test host, user_id 2
        #Test user is setup in setup_test_database
      
      connection.exec("INSERT INTO spaces (space_name, userid, space_description, space_price, available_from, available_to)
                                  values ('testspace2', '2', 'This is the test space2', '99.99', '2022-05-22', '2022-05-22');")
      
      Request.create(space_id: '2' , check_out: "2024-05-06" , check_in: '2024-05-05' , guest:'1' , host: '2' , approved: 'f')#spaceid 2 owned by testuser2 (userid_2), user_id 1 has requested this space

      expect(Request.guest_request(userid: 1).length).to eq 1

    end 
  end
end