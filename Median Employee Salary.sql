-- Table: Employee

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | id           | int     |
-- | company      | varchar |
-- | salary       | int     |
-- +--------------+---------+
-- id is the primary key column for this table.
-- Each row of this table indicates the company and the salary of one employee.
 

-- Write an SQL query to find the median salary of each company.

-- Return the result table in any order.

-- The query result format is in the following example.

 

-- Example 1:

-- Input: 
-- Employee table:
-- +----+---------+--------+
-- | id | company | salary |
-- +----+---------+--------+
-- | 1  | A       | 2341   |
-- | 2  | A       | 341    |
-- | 3  | A       | 15     |
-- | 4  | A       | 15314  |
-- | 5  | A       | 451    |
-- | 6  | A       | 513    |
-- | 7  | B       | 15     |
-- | 8  | B       | 13     |
-- | 9  | B       | 1154   |
-- | 10 | B       | 1345   |
-- | 11 | B       | 1221   |
-- | 12 | B       | 234    |
-- | 13 | C       | 2345   |
-- | 14 | C       | 2645   |
-- | 15 | C       | 2645   |
-- | 16 | C       | 2652   |
-- | 17 | C       | 65     |
-- +----+---------+--------+
-- Output: 
-- +----+---------+--------+
-- | id | company | salary |
-- +----+---------+--------+
-- | 5  | A       | 451    |
-- | 6  | A       | 513    |
-- | 12 | B       | 234    |
-- | 9  | B       | 1154   |
-- | 14 | C       | 2645   |
-- +----+---------+--------+

with t1 as (
  Select id, company, salary, row_number() over (partition by Company order by Salary asc) as rank_emp
  From Employee
),

t2 as (
  select company, count(*) as count_emp from Employee group by 1
)

Select a.id, a.company, a.salary From t1 a, t2, b where a.compay = b.compay and a.rank_emp between b.cont_emp/2.0 and b.count_emp/2.0+1;