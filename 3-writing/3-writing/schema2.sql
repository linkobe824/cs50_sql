create table if not exists "collections" (
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

CREATE TRIGGER "buy"
AFTER INSERT ON "collections"
FOR EACH ROW
BEGIN
    INSERT INTO "transactions" ("title", "action")
    VALUES (NEW."title", "bought");
END;

CREATE TRIGGER "sell"
BEFORE DELETE ON "collections"
FOR EACH ROW
BEGIN
    INSERT INTO "transactions" ("title", "action")
    VALUES (OLD."title", 'sold');
END;
