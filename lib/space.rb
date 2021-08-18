class Space

  def self.create
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    connection.exec(
      "INSERT INTO users (space_name, space_description, space_price, available_from, available_to)
       VALUES ('', '', 
      '', '', '');"
    )

  end
end