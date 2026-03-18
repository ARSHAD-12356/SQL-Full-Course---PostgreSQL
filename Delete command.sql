---- DELETE FROM (WHERE __) ---> Delete Specific rows 


DELETE FROM employee2
WHERE employee_id = 105

select * from employee2;

-- To delete specific column use DROP COLUMN command inside the ALTER TABLE 
-- Table Delete --> DROP
-- Database Delete --> DROP

ALTER TABLE employee2
DROP COLUMN salary;

select * from employee2;

DROP TABLE IF EXISTS employee2
DROP DATABASE IF EXISTS company;
