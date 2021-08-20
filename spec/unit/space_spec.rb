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
end