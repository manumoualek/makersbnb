CREATE TABLE requests (
id SERIAL PRIMARY KEY,
space_id INT,
check_out DATE,
check_in DATE,
guest INT,
host INT,
CONSTRAINT fk_guest 
  FOREIGN KEY(guest)
    REFERENCES users(UserID),
CONSTRAINT fk_host
  FOREIGN KEY(host)
    REFERENCES users(UserID),
CONSTRAINT fk_space_id
  FOREIGN KEY(space_id)
    REFERENCES spaces(spaceID)    
); 

#Line 8: Uses the userID from users table as the FK to reference spaces they have have requested
#Line 11: Uses the UserID from users table as the FK to reference spaces they have listed.
#Line 14: Uses the space_id from the spaces table as the FK to reference the space listed or requested.