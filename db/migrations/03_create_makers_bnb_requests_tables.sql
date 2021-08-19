CREATE TABLE requests (
ID SERIAL PRIMARY KEY,
Requested_space_name VARCHAR(60),
Check_out DATE,
Check_in DATE,
Requestee INT,
Requester INT
); 