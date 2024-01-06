-- select title of episodes from season 2 that contains the word "number" in the topic;

SELECT title FROM episodes
WHERE season == 2 AND LOWER(topic) LIKE "%number%";
