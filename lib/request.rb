class Request
  
  def self.create(space_id: , check_out: , check_in: , guest: , host: , approved:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    connection.exec(
      "INSERT INTO requests (space_id, check_out , check_in , guest , host , approved) 
       VALUES ('#{space_id}', '#{check_out}', 
      '#{check_in}', '#{guest}', '#{host}', '#{approved}');"
    )


  end  

end  