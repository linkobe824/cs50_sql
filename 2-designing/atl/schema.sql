CREATE TABLE "passengers" (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE "check_ins" (
    id INTEGER,
    passenger_id INTEGER,
    checked_in NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    flight_id INTEGER,
    PRIMARY KEY(id),
    FOREIGN KEY(flight_id) REFERENCES flights(id),
    FOREIGN KEY(passenger_id) REFERENCES passengers(id)
);

CREATE TABLE "airlines" (
    id INTEGER,
    name TEXT NOT NULL,
    concourse TEXT NOT NULL CHECK(concourse IN ("A","B","C","D","E", "F", "T")),
    PRIMARY KEY(id)
);

CREATE TABLE "flights" (
    id INTEGER,
    flight_number INTEGER,
    airline_id INTEGER,
    from_airport_code TEXT NOT NULL CHECK(LENGTH(code_from) == 3),
    to_airport_code TEXT NOT NULL CHECK(LENGTH(code_to) == 3),
    departure NUMERIC NOT NULL,
    arrival NUMERIC NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(airline_id) REFERENCES airlines(id)
);
