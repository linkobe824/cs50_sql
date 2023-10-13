CREATE TABLE IF NOT EXISTS "ingredients" (
    "id" INTEGER,
    "ingredient" TEXT NOT NULL,
    "price_per_unit" TEXT NUMERIC NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "donuts" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten_free" INTEGER CHECK("gluten_free" IN (0,1)) DEFAULT 0,
    "price" NUMERIC NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "donut_ingredients" (
    "id" INTEGER,
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id"),
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "orders" (
    "id" INTEGER,
    "donut_id" INTEGER,
    "quantity" INTEGER NOT NULL,
    "customer_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE IF NOT EXISTS "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "orders_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("orders_id") REFERENCES "orders"("id") 
);