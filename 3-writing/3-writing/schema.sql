CREATE TABLE IF NOT EXISTS "collections" (
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "accession_number" TEXT NOT NULL UNIQUE,
    "acquired" NUMERIC,
    PRIMARY KEY ("id")
);
CREATE TABLE IF NOT EXISTS "artists" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY ("id")
);
CREATE TABLE IF NOT EXISTS "created" (
    "artist_id" INTEGER,
    "collection_id" INTEGER,
    PRIMARY KEY ("artist_id", "collection_id"),
    FOREIGN KEY ("artist_id") REFERENCES "artists"("id"),
    FOREIGN KEY ("collection_id") REFERENCES "collections"("id")
);
