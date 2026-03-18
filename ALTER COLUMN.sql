-- ---  ALTER Column Query ----

-- table used of update data query---
select * from customers order by user_id asc;

-- To Rename the username column to Full_Name ---

ALTER TABLE users
RENAME COLUMN username TO full_name;

-- To change the age column's data type from INT to SMALLINT

ALTER TABLE users
ALTER COLUMN age TYPE SMALLINT;

-- To ad a not null constrant to city column
ALTER TABLE users
ALTER COLUMN city SET NOT NULL;

-- Adding CHECK CONSTRANT TO AGE COLUMN
ALTER TABLE users
DROP CONSTRAINT age;

ALTER TABLE users
ADD CONSTRAINT age CHECK(age>=18);

INSERT INTO USERS (full_name,EMAIL,AGE,CITY)
VALUES('Mukesh','mukesh@gmail.com','18','Mumbai');

-- To Rename the table name ---
ALTER TABLE users
RENAME TO customers;