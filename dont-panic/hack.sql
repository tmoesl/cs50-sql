-- 'oops!' MD5 hashed is '982c0381c279d139fd221fce974916e7'
-- https://www.md5hashgenerator.com/

-- Update admin password
UPDATE users
SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

-- Update user log with new password for admin
UPDATE user_logs
SET "new_password" = (
    SELECT "password"
    FROM users
    WHERE "username" = 'emily33')
WHERE "type" = 'update'
    AND "old_username" = 'admin';

/*

-- Insert a misleading log entry to frame emily33
INSERT INTO user_logs ("type", "old_username", "new_username", "old_password", "new_password")
VALUES ('update', 'admin', 'admin',
    (SELECT "password" FROM "users" WHERE "username" = 'admin'),
    (SELECT "password" FROM "users" WHERE "username" = 'emily33'));

-- Update admin password
UPDATE users
SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

-- Delete the latest entry in user_logs
DELETE FROM user_logs
WHERE "id" = (
    SELECT "id"
    FROM "user_logs"
    ORDER BY "id" DESC
    LIMIT 1);
*/
