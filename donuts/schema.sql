-- -----------------------------
-- PRE CHECKS
-- -----------------------------

-- Disable foreign key checks
PRAGMA foreign_keys = OFF;

-- Deletes prior tables if they exist
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS donuts;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_donuts;
DROP TABLE IF EXISTS donut_ingredients;

-- Re-enable foreign key checks
PRAGMA foreign_keys = ON;


-- -----------------------------
-- TABLE CREATION
-- -----------------------------
CREATE TABLE customers (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE ingredients (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price_per_unit" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE donuts (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten_free" TEXT NOT NULL CHECK ("gluten_free" IN ('yes', 'no')),
    "price" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE donut_ingredients (
    "id" INTEGER,
    "donut_id" INTEGER NOT NULL,
    "ingredient_id" INTEGER NOT NULL,
    "quantity" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("donut_id") REFERENCES donuts("id"),
    FOREIGN KEY("ingredient_id") REFERENCES ingredients("id"),
    UNIQUE("donut_id", "ingredient_id")
);

CREATE TABLE orders (
    "id" INTEGER,
    "order_id" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "datetime" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES customers("id")
);

CREATE TABLE order_donuts (
    "id" INTEGER,
    "order_id" INTEGER NOT NULL,
    "donut_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL CHECK ("quantity" > 0),
    PRIMARY KEY("id"),
    FOREIGN KEY("order_id") REFERENCES orders("id"),
    FOREIGN KEY("donut_id") REFERENCES donuts("id")
);


-- -----------------------------
-- INSERT SAMPLE DATA
-- -----------------------------

-- Insert customers
INSERT INTO customers ("first_name", "last_name")
VALUES
    ('Luis', 'Singh'),
    ('Maria', 'Lopez'),
    ('James', 'Smith'),
    ('Emily', 'Chen'),
    ('Oliver', 'Jones');;

-- Insert donut ingredients
INSERT INTO ingredients ("name", "price_per_unit")
VALUES
    ('Cocoa', 5.00),
    ('Sugar', 2.00),
    ('Flour', 1.50),
    ('Buttermilk', 3.00),
    ('Sprinkles', 1.00);

-- Insert donuts
INSERT INTO donuts ("name", "gluten_free", "price")
VALUES
    ('Belgian Dark Chocolate', 'no', 4.00),
    ('Back-To-School Sprinkles', 'no', 4.00);

-- Insert donut ingredients 'Belgian Dark Chocolate'
INSERT INTO donut_ingredients ("donut_id", "ingredient_id", "quantity")
VALUES
    ((SELECT "id" FROM donuts WHERE "name" = 'Belgian Dark Chocolate'), (SELECT "id" FROM ingredients WHERE "name" = 'Cocoa'), 1),
    ((SELECT "id" FROM donuts WHERE "name" = 'Belgian Dark Chocolate'), (SELECT "id" FROM ingredients WHERE "name" = 'Flour'), 2),
    ((SELECT "id" FROM donuts WHERE "name" = 'Belgian Dark Chocolate'), (SELECT "id" FROM ingredients WHERE "name" = 'Buttermilk'), 1),
    ((SELECT "id" FROM donuts WHERE "name" = 'Belgian Dark Chocolate'), (SELECT "id" FROM ingredients WHERE "name" = 'Sugar'), 1);

-- Insert donut ingredients 'Back-To-School Sprinkles'
INSERT INTO donut_ingredients ("donut_id", "ingredient_id", "quantity")
VALUES
    ((SELECT "id" FROM donuts WHERE "name" = 'Back-To-School Sprinkles'), (SELECT "id" FROM ingredients WHERE "name" = 'Flour'), 2),
    ((SELECT "id" FROM donuts WHERE "name" = 'Back-To-School Sprinkles'), (SELECT "id" FROM ingredients WHERE "name" = 'Buttermilk'), 1),
    ((SELECT "id" FROM donuts WHERE "name" = 'Back-To-School Sprinkles'), (SELECT "id" FROM ingredients WHERE "name" = 'Sugar'), 1),
    ((SELECT "id" FROM donuts WHERE "name" = 'Back-To-School Sprinkles'), (SELECT "id" FROM ingredients WHERE "name" = 'Sprinkles'), 1);

-- Insert orders
INSERT INTO orders ("order_id", "customer_id")
VALUES
    (1, (SELECT "id" FROM customers WHERE "first_name" = 'Luis' AND "last_name" = 'Singh')),
    (2, (SELECT "id" FROM customers WHERE "first_name" = 'Maria' AND "last_name" = 'Lopez')),
    (3, (SELECT "id" FROM customers WHERE "first_name" = 'James' AND "last_name" = 'Smith')),
    (4, (SELECT "id" FROM customers WHERE "first_name" = 'Emily' AND "last_name" = 'Chen'));

-- Insert donuts in orderssql
INSERT INTO order_donuts ("order_id", "donut_id", "quantity")
VALUES
    -- Add donuts to Order 1 (Luis Singh)
    ((SELECT "id" FROM orders WHERE "order_id" = 1), (SELECT "id" FROM donuts WHERE "name" = 'Belgian Dark Chocolate'), 3),
    ((SELECT "id" FROM orders WHERE "order_id" = 1), (SELECT "id" FROM donuts WHERE "name" = 'Back-To-School Sprinkles'), 2),

    -- Add donuts to Order 2 (Maria Lopez)
    ((SELECT "id" FROM orders WHERE "order_id" = 2), (SELECT "id" FROM donuts WHERE "name" = 'Belgian Dark Chocolate'), 2),
    ((SELECT "id" FROM orders WHERE "order_id" = 2), (SELECT "id" FROM donuts WHERE "name" = 'Back-To-School Sprinkles'), 1),

    -- Add donuts to Order 3 (James Smith)
    ((SELECT "id" FROM orders WHERE "order_id" = 3), (SELECT "id" FROM donuts WHERE "name" = 'Belgian Dark Chocolate'), 1),
    ((SELECT "id" FROM orders WHERE "order_id" = 3), (SELECT "id" FROM donuts WHERE "name" = 'Back-To-School Sprinkles'), 3),

    -- Add donuts to Order 4 (Emily Chen)
    ((SELECT "id" FROM orders WHERE "order_id" = 4), (SELECT "id" FROM donuts WHERE "name" = 'Belgian Dark Chocolate'), 1),
    ((SELECT "id" FROM orders WHERE "order_id" = 4), (SELECT "id" FROM donuts WHERE "name" = 'Back-To-School Sprinkles'), 2);
