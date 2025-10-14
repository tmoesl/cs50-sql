-- -----------------------------
-- PRE CHECKS
-- -----------------------------

-- Deletes prior tables / views if they exist
DROP TABLE IF EXISTS white_paper;
DROP VIEW IF EXISTS message;


-- -----------------------------
-- TABLE CREATION
-- -----------------------------

-- Creates the whitepaper table
CREATE TABLE white_paper (
    "id" INTEGER,
    "index" INTEGER,
    "length" INTEGER,
    PRIMARY KEY ("id")
);

-- Insert triplets
INSERT INTO white_paper ("id", "index", "length")
VALUES
    (14, 98, 4),
    (114, 3, 5),
    (618, 72, 9),
    (630, 7, 3),
    (932, 12, 5),
    (2230, 50, 7),
    (2346, 44, 10),
    (3041, 14, 5);


-- -----------------------------
-- VIEW CREATION
-- -----------------------------
CREATE VIEW message AS
SELECT SUBSTR(s."sentence", w."index", w."length") AS phrase
FROM sentences AS s
INNER JOIN white_paper AS w
    ON s."id" = w."id";


/*
CREATE TABLE white_paper (
    "id" INTEGER,
    "phrase" TEXT NOT NULL,
    PRIMARY KEY("id")
);

INSERT INTO white_paper ("phrase")
SELECT SUBSTR("sentence", 98, 4) FROM sentences WHERE "id" = 14
UNION ALL
SELECT SUBSTR("sentence", 3, 5) FROM sentences WHERE "id" = 114
UNION ALL
SELECT SUBSTR("sentence", 72, 9) FROM sentences WHERE "id" = 618
UNION ALL
SELECT SUBSTR("sentence", 7, 3) FROM sentences WHERE "id" = 630
UNION ALL
SELECT SUBSTR("sentence", 12, 5) FROM sentences WHERE "id" = 932
UNION ALL
SELECT SUBSTR("sentence", 50, 7) FROM sentences WHERE "id" = 2230
UNION ALL
SELECT SUBSTR("sentence", 44, 10) FROM sentences WHERE "id" = 2346
UNION ALL
SELECT SUBSTR("sentence", 14, 5) FROM sentences WHERE "id" = 3041;

CREATE VIEW message AS
SELECT "phrase" FROM white_paper;
*/
