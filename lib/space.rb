class Space

  def self.create(space_name:, space_description:, space_price:, available_from:, available_to:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    connection.exec(
      "INSERT INTO spaces (space_name, space_description, space_price, available_from, available_to)
       VALUES ('#{space_name}', '#{space_description}', 
      '#{space_price}', '#{available_from}', '#{available_to}');"
    )
  end
end