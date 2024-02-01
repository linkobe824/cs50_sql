CREATE TABLE "meteorites_temp" (
    name TEXT,
    id TEXT,
    nametype TEXT,
    class TEXT,
    mass NUMERIC,
    discovery TEXT,
    year INTEGER,
    lat NUMERIC,
    long NUMERIC
);

.import --csv --skip 1 meteorites.csv meteorites_temp

-- NULL VALUES
UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE trim("mass") = '';

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE trim("year") = '';

UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE trim("lat") = '';

UPDATE "meteorites_temp"
SET "long" = NULL
WHERE trim("long") = '';

-- ROUND

UPDATE "meteorites_temp"
SET "mass" = ROUND(mass, 2);

UPDATE "meteorites_temp"
SET "lat" = ROUND(lat, 2);

UPDATE "meteorites_temp"
SET "long" = ROUND(long, 2);

-- DELETE nametype Relict

DELETE FROM "meteorites_temp"
WHERE "nametype" = 'Relict';

-- ORDER by year and name
CREATE TABLE "meteorites" (
    id INTEGER,
    name TEXT,
    class TEXT,
    mass NUMERIC,
    discovery TEXT,
    year INTEGER,
    lat NUMERIC,
    long NUMERIC,
    PRIMARY KEY("id")
);

INSERT INTO meteorites (name, class, mass, discovery, year, lat, long)
SELECT name, class, mass, discovery, year, lat, long FROM meteorites_temp
ORDER BY year ASC, name ASC;

DROP TABLE meteorites_temp;
