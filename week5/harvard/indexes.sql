-- -----------------------------
-- PRE CHECKS
-- -----------------------------

-- Drop indexes on courses table
DROP INDEX IF EXISTS idx_courses_department_semester;
DROP INDEX IF EXISTS idx_courses_semester_title;
DROP INDEX IF EXISTS idx_courses_department_number_semester;

-- Drop indexes on enrollments table
DROP INDEX IF EXISTS idx_enrollments_student;
DROP INDEX IF EXISTS idx_enrollments_course;

-- Drop indexes on satisfies table
DROP INDEX IF EXISTS idx_satisfies_course;


-- -----------------------------
-- INDEX CREATION
-- -----------------------------

-- Indexes for courses table
CREATE INDEX idx_courses_department_semester ON courses ("department", "semester");
CREATE INDEX idx_courses_semester_title ON courses ("semester", "title");
CREATE INDEX idx_courses_department_number_semester ON courses ("department", "number", "semester");

-- Indexes for enrollments table
CREATE INDEX idx_enrollments_student ON enrollments ("student_id");
CREATE INDEX idx_enrollments_course ON enrollments ("course_id");

-- Indexes for satisfies table
CREATE INDEX idx_satisfies_course ON satisfies ("course_id");


-- -----------------------------
-- QUERIES
-- -----------------------------

/*
EXPLAIN QUERY PLAN
SELECT "courses"."title", "courses"."semester"
FROM "enrollments"
JOIN "courses" ON "enrollments"."course_id" = "courses"."id"
JOIN "students" ON "enrollments"."student_id" = "students"."id"
WHERE "students"."id" = 3;

EXPLAIN QUERY PLAN
SELECT "id", "name"
FROM "students"
WHERE "id" IN (
    SELECT "student_id"
    FROM "enrollments"
    WHERE "course_id" = (
        SELECT "id"
        FROM "courses"
        WHERE "courses"."department" = 'Computer Science'
        AND "courses"."number" = 50
        AND "courses"."semester" = 'Fall 2023'
    )
);

EXPLAIN QUERY PLAN
SELECT "courses"."id", "courses"."department", "courses"."number", "courses"."title", COUNT(*) AS "enrollment"
FROM "courses"
JOIN "enrollments" ON "enrollments"."course_id" = "courses"."id"
WHERE "courses"."semester" = 'Fall 2023'
GROUP BY "courses"."id"
ORDER BY "enrollment" DESC;

EXPLAIN QUERY PLAN
SELECT "courses"."id", "courses"."department", "courses"."number", "courses"."title"
FROM "courses"
WHERE "courses"."department" = 'Computer Science'
AND "courses"."semester" = 'Spring 2024';

EXPLAIN QUERY PLAN
SELECT "requirements"."name"
FROM "requirements"
WHERE "requirements"."id" = (
    SELECT "requirement_id"
    FROM "satisfies"
    WHERE "course_id" = (
        SELECT "id"
        FROM "courses"
        WHERE "title" = 'Advanced Databases'
        AND "semester" = 'Fall 2023'
    )
);

EXPLAIN QUERY PLAN
SELECT "requirements"."name", COUNT(*) AS "courses"
FROM "requirements"
JOIN "satisfies" ON "requirements"."id" = "satisfies"."requirement_id"
WHERE "satisfies"."course_id" IN (
    SELECT "course_id"
    FROM "enrollments"
    WHERE "enrollments"."student_id" = 8
)
GROUP BY "requirements"."name";


EXPLAIN QUERY PLAN
SELECT "department", "number", "title"
FROM "courses"
WHERE "title" LIKE "History%"
AND "semester" = 'Fall 2023';
*/
