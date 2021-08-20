describe "space" do
  describe "Create a space method" do
    it "Should add a space to the database" do
      connection = PG.connect(dbname: 'makersbnb_test')

        Space.create(space_name: "Valley of the end", space_description: "Very big valley with lots of end yes", 
          space_price: "95.00", available_from: "2021/05/05", available_to: "2021/05/06", userID: '1')

        result = connection.exec("SELECT * FROM spaces;").to_a

        expect(result[0]['space_name']).to eq('Valley of the end')
        expect(result[0]['space_description']).to eq('Very big valley with lots of end yes')
        expect(result[0]['space_price']).to eq('95.00')
        expect(result[0]['available_from']).to eq('2021-05-05')
        expect(result[0]['available_to']).to eq('2021-05-06')
    end
  end

  describe "Booking_space method" do
    it "Returns the space the user wishes to book via its spaceID" do
      connection = PG.connect(dbname: 'makersbnb_test')

      connection.exec(
        "INSERT INTO spaces (spaceid, space_name, space_description, space_price, available_from, available_to, userid)
         VALUES ('1', 'Pizza place', 'Lots of pizza', 
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