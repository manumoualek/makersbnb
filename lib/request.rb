require 'database_connection.rb'
class Request
  
  def self.create(space_id: , check_out: , check_in: , guest: , host: , approved:)
    db_connect.exec(
      "INSERT INTO requests (space_id, check_out , check_in , guest , host , approved) 
       VALUES ('#{space_id}', '#{check_out}', 
      '#{check_in}', '#{guest}', '#{host}', '#{approved}');"
    )
  end  

end  