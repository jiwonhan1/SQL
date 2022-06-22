-- Table: World

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | name        | varchar |
-- | continent   | varchar |
-- | area        | int     |
-- | population  | int     |
-- | gdp         | int     |
-- +-------------+---------+
-- name is the primary key column for this table.
-- Each row of this table gives information about the name of a country, the continent to which it belongs, its area, the population, and its GDP value.

-- Approach 1
SELECT name, population, area FROM World WHERE area >= 3000000 OR population >= 25000000;


-- Approach 2
SELECT name, population, area FROM World WHERE area >= 3000000 

UNION

SELECT name, population, area FROM World WHERE population >= 25000000;
