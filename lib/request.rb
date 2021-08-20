class Request
  def self.db_connect
    if ENV['ENVIRONMENT'] == 'test'
      return connection = PG.connect(dbname: 'makersbnb_test')
    else
      return connection = PG.connect(dbname: 'makersbnb')
    end
  end
  
  def self.create(space_id: , check_out: , check_in: , guest: , host: , approved:)
    db_connect.exec(
      "INSERT INTO requests (space_id, check_out , check_in , guest , host , approved) 
       VALUES ('#{space_id}', '#{check_out}', 
      '#{check_in}', '#{guest}', '#{host}', '#{approved}');"
    )
  end  
end