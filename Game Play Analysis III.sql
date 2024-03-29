-- Table: Activity

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
-- (player_id, event_date) is the primary key of this table.
-- This table shows the activity of players of some games.
-- Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
 

-- Write an SQL query to report for each player and date, how many games played so far by the player. That is, the total number of games played by the player until that date. Check the example for clarity.

-- Return the result table in any order.

-- The query result format is in the following example.

 

-- Example 1:

-- Input: 
-- Activity table:
-- +-----------+-----------+------------+--------------+
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1         | 2         | 2016-03-01 | 5            |
-- | 1         | 2         | 2016-05-02 | 6            |
-- | 1         | 3         | 2017-06-25 | 1            |
-- | 3         | 1         | 2016-03-02 | 0            |
-- | 3         | 4         | 2018-07-03 | 5            |
-- +-----------+-----------+------------+--------------+
-- Output: 
-- +-----------+------------+---------------------+
-- | player_id | event_date | games_played_so_far |
-- +-----------+------------+---------------------+
-- | 1         | 2016-03-01 | 5                   |
-- | 1         | 2016-05-02 | 11                  |
-- | 1         | 2017-06-25 | 12                  |
-- | 3         | 2016-03-02 | 0                   |
-- | 3         | 2018-07-03 | 5                   |
-- +-----------+------------+---------------------+
-- Explanation: 
-- For the player with id 1, 5 + 6 = 11 games played by 2016-05-02, and 5 + 6 + 1 = 12 games played by 2017-06-25.
-- For the player with id 3, 0 + 5 = 5 games played by 2018-07-03.
-- Note that for each player we only care about the days when the player logged in.

-- Self Join
SELECT a1.player_id, a1.event_Date, SUM(a2.games_played) AS games_played_so_far FROM Activity a1, Activity a2 WHERE a1.player_id = a2.player_id AND a1.event_date >= a2.event_date GROUP BY a1.player_id, a1.event_date ORDER BY a1.player_id, a1.event_date;

-- Window functions
SELECT player_id, event_date, sum(games_played) OVER (Partition By player_id ORDER BY event_date) AS 'games_played_so_far' FROM Activity ORDER BY player_id, games_played_so_far;

-- Sub query
SELECT a1.player_id, a1.event_date, (
  SELECT sum(a2.games_played) FROM Activity a2
  WHERE a1.player_id = a2.player_id ANd a1.event_date >= a2.event_date GROUP BY a1.player_id
) AS games_played_so_far
FROM Activity a1 ORDER BY a1.player_id, games_played_so_far;