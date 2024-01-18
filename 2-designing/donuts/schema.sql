CREATE TABLE ingredients (
    id INTEGER,
    ingredient TEXT NOT NULL UNIQUE,
    price_per_pound NUMERIC NOT NULL,
    price_per_gram NUMERIC NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE donuts (
    id INTEGER,
    name TEXT NOT NULL UNIQUE,
    gluten_free BOOLEAN NOT NULL,
    price NUMERIC NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE donut_ingredients (
    id INTEGER,
    donut_id INTEGER,
    ingredient_id INTEGER,
    PRIMARY KEY(id),
    FOREIGN KEY(donut_id) REFERENCES donuts(id),
    FOREIGN KEY(ingredient_id) REFERENCES ingredients(id)
);

CREATE TABLE orders (
    id INTEGER,
    customer_id INTEGER,
    PRIMARY KEY(id),
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

CREATE TABLE customers (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE order_donuts (
    id INTEGER,
    order_id INTEGER,
    donut_id INTEGER,
    quantity INTEGER NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(donut_id) REFERENCES donuts(id)
);
