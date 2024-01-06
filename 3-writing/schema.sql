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
    FOREIGN KEY ("artist_id") REFERENCES "artists"("id") ON DELETE CASCADE,
    FOREIGN KEY ("collection_id") REFERENCES "collections"("id") ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "transactions" (
    "id" INTEGER,
    "title" TEXT,
    "action" TEXT,
    PRIMARY KEY ("id")
);




CREATE TRIGGER name
BEFORE (o AFTER) INSERT ON table (o UPDATE OF column ON table o DELETE ON table)
FOR EACH ROW
BEGIN
    ...;
END;

create table if not EXISTS "collections" (
    "id" integer,
    "title" text not null,
    PRIMARY key ("id")
);

create table if not exists "transactions" (
    "id" integer,
    "title" text,
    "action" text,
    PRIMARY key ("id")
);


INSERT INTO "collections" ("title")
VALUES
('Farmers working at dawn'),
('Imaginative landscape'),
('Profusion of flowers'),
('Peonies and butterfly');

CREATE TRIGGER "sell"
BEFORE DELETE ON "collections"
FOR EACH ROW
BEGIN
    INSERT INTO "transactions" ("title", "action")
    VALUES (OLD."title", 'sold');
END;

CREATE TRIGGER "buy"
AFTER INSERT ON "collections"
FOR EACH ROW
BEGIN
    INSERT INTO "transactions" ("title", "action")
    VALUES (NEW."title", "bought");
END;

ALTER TABLE "collections"
ADD "deleted" integer DEFAULT 0;

UPDATE "collections" SET "deleted" = 1 WHERE "title" = 'Farmers working at dawn';




