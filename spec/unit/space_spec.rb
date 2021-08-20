describe "space" do
  describe "Create a space method" do
    it "Should add a space to the database" do
      connection = PG.connect(dbname: 'makersbnb_test')

        result = connection.exec("SELECT * FROM spaces;").to_a

        expect(result[0]['space_name']).to eq('testspace1')
        expect(result[0]['space_description']).to eq('This is the test space')
        expect(result[0]['space_price']).to eq('99.99')
        expect(result[0]['available_from']).to eq('2022-05-05')
        expect(result[0]['available_to']).to eq('2022-05-06')
        expect(result[0]['userid']).to eq ('1')
    end
  end

  describe "Booking_space method" do
    it "Returns the space the user wishes to book via its spaceID" do
      connection = PG.connect(dbname: 'makersbnb_test')

      connection.exec(
        "INSERT INTO spaces (spaceid, space_name, space_description, space_price, available_from, available_to, userid)
         VALUES ('4', 'Pizza place', 'Lots of pizza', 
        '40', '2021-06-23', '2021-06-25', '1');"
      )
      connection.exec(
        "INSERT INTO spaces (spaceid, space_name, space_description, space_price, available_from, available_to, userid)
         VALUES ('2', 'Dylans house', 'Lots of nothing', 
        '1', '2021-06-23', '2021-06-25', '1');"
      )
      connection.exec(
        "INSERT INTO spaces (spaceid, space_name, space_description, space_price, available_from, available_to, userid)
         VALUES ('3', 'Cave', 'Darkness', 
        '0', '2021-06-23', '2021-06-25', '1');"
      )

      result = Space.booking_space(spaceid: 2)
      expect(result[0]).to include("space_name"=>"Dylans house")
      expect(result[0]).to include("spaceid"=>"2")
      expect(result[0]).to include("space_price"=>"1.00")
      expect(result[0]).to include("space_description"=>"Lots of nothing")
      expect(result[0]).to include("available_from"=>"2021-06-23")
      expect(result[0]).to include("available_to"=>"2021-06-25")
      expect(result[0]).to include("userid"=>"1")
    end
  end
end