-- top 10 tallest players from philadelphia PA
SELECT first_name, last_name, height FROM players
WHERE birth_city == "Philadelphia" AND birth_state == "PA"
ORDER BY height DESC, first_name ASC, last_name ASC LIMIT 10;
