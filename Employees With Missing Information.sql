-- Table: Employees

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | employee_id | int     |
-- | name        | varchar |
-- +-------------+---------+
-- employee_id is the primary key for this table.
-- Each row of this table indicates the name of the employee whose ID is employee_id.
 

--  Table: Salaries

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | employee_id | int     |
-- | salary      | int     |
-- +-------------+---------+
-- employee_id is the primary key for this table.
-- Each row of this table indicates the salary of the employee whose ID is employee_id.

-- Write an SQL query to report the IDs of all the employees with missing information. The information of an employee is missing if:

-- The employee's name is missing, or
-- The employee's salary is missing.
-- Return the result table ordered by employee_id in ascending order.

-- The query result format is in the following example.

SELECT e.employee_id FROM Employees e WHERE e.employee_id NOT IN (SELECT s.employee_id FROM Salaries s WHERE s.salary IS NOT NULL) 
UNION
SELECT s.employee_id FROM Salaries s WHERE s.employee_id NOT IN (SELECT e.employee_id FROM Employees e WHERE e.name IS NOT NULL)
ORDER BY 1 ASC

--ORDER BY 1 ASC simply means sorting the view or table by 1st column of query's result in ascending order!