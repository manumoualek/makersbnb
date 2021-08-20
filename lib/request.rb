require 'database_connection.rb'
class Request
  
  def self.create(space_id: , check_out: , check_in: , guest: , host: , approved:)
    db_connect.exec(
      "INSERT INTO requests (space_id, check_out , check_in , guest , host , approved) 
       VALUES ('#{space_id}', '#{check_out}', 
      '#{check_in}', '#{guest}', '#{host}', '#{approved}');"
    )
  end  

  def self.host_request(userid:) 
    hosts_request  = db_connect.exec(
      "SELECT * FROM requests WHERE host = '#{userid}';").to_a
  end 

  def self.guest_request(userid:)
    guest_request = db_connect.exec(
      "SELECT * FROM requests WHERE guest = '#{userid}';").to_a
  end 

end  