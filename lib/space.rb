require 'database_connection.rb'

class Space

  def self.create(space_name:, space_description:, userID:, space_price:, available_from:, available_to:)
    db_connect.exec(
      "INSERT INTO spaces (space_name, space_description, space_price, available_from, available_to, userid) 
       VALUES ('#{space_name}', '#{space_description}', 
      '#{space_price}', '#{available_from}', '#{available_to}', '#{userID}');"
    )
  end

  def self.all
    db_connect.exec("SELECT * FROM spaces;")
  end
end