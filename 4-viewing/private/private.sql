CREATE TABLE IF NOT EXISTS code (
    sentence_id INTEGER,
    char_begin INTEGER,
    sentence_length INTEGER
);

INSERT INTO code (sentence_id, char_begin, sentence_length)
VALUES
(14,98,4),
(114,3,5),
(618,72,9),
(630, 7,3),
(932,12, 5),
(2230, 50, 7),
(2346,44 ,10),
(3041, 14, 5);

CREATE VIEW message AS
SELECT substr(sentences.sentence, char_begin, sentence_length) AS phrase FROM code
JOIN sentences ON sentences.id = code.sentence_id;
