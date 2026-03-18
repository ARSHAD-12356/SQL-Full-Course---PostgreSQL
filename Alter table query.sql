-- ---  ALTER Column Query ----

-- table used of update data query---
select * from users order by user_id asc;

-- To Rename the username column to Full_Name ---

ALTER TABLE users
RENAME COLUMN username TO full_name;

-- To change the age column's data type from INT to SMALLINT

ALTER TABLE users
ALTER 