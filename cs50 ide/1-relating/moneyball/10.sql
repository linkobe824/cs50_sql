-- The general manager has asked you for a report which details each player’s name,
-- their salary for each year they’ve been playing, and their number of home runs for each year they’ve been playing.
-- To be precise, the table should include:

-- All player’s first names
-- All player’s last names
-- All player’s salaries
-- All player’s home runs
-- The year in which the player was paid that salary and hit those home runs

-- n 10.sql, write a query to return just such a table.

-- Your query should return a table with five columns, per the above.
-- Order the results, first and foremost, by player’s IDs (least to greatest).
-- Order rows about the same player by year, in descending order.
-- Consider a corner case: suppose a player has multiple salaries or performances for a given year.
--  Order them first by number of home runs, in descending order, followed by salary, in descending order.
-- Be careful to ensure that, for a single row, the salary’s year and the performance’s year match.

SELECT first_name, last_name, salaries.salary, salaries.year, performances.HR FROM players
JOIN salaries ON salaries.player_id == players.id
JOIN performances ON performances.player_id == players.id
AND performances.year == salaries.year
ORDER BY players.id ASC,performances.year DESC, performances.HR DESC, salaries.salary DESC;
