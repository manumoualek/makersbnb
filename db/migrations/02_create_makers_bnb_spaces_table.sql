-- Create table in makersbnb 

###Line 13 a column in which the FK will reside. Create the column first and then add the FK to this column after.

CREATE TABLE spaces (
spaceID SERIAL PRIMARY KEY,
space_name VARCHAR (60),
UserID INT,                            
space_description VARCHAR (60),
space_price DECIMAL (10, 2),
available_from DATE,
available_to DATE,
CONSTRAINT fk_user
  FOREIGN KEY(UserID)
    REFERENCES users(UserID)
);

-- Create table in makersbnb_test.

CREATE TABLE spaces (
spaceID SERIAL PRIMARY KEY,
space_name VARCHAR (60),
UserID INT,                            
space_description VARCHAR (60),
space_price DECIMAL (10, 2),
available_from DATE,
available_to DATE,
CONSTRAINT fk_user
  FOREIGN KEY(UserID)
    REFERENCES users(UserID)
);