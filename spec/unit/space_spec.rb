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
      
    end
  end
end