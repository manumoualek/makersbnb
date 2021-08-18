-- Create table in makersbnb 

CREATE TABLE spaces (
spaceID SERIAL PRIMARY KEY,
space_name VARCHAR (60),
space_description VARCHAR (60),
space_price DECIMAL (10, 2),
available_from DATE,
available_to DATE,
owner INT
); 

-- Create table in makersbnb_test.

CREATE TABLE spaces (
spaceID SERIAL PRIMARY KEY,
space_name VARCHAR (60),
space_description VARCHAR (60),
space_price DECIMAL (10, 2),
available_from DATE,
available_to DATE,
owner INT
); 