UPDATE users SET created_at = NOW(), updated_at = NOW();

SELECT STR_TO_DATE(created_at, '%d.%m%Y %k:%i') from users;
UPDATE users SET created_at = STR_TO_DATE(creates_at, '%d.%m%Y %k:%i'), updated_at = STR_TO_DATE(creates_at, '%d.%m%Y %k:%i');
alter table users CHANGE created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
alter table users CHANGE updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

SELECT * FROM starehouses_products ORDER BY IF(value > 0, 0, 1), value;

SELECT name FROM users WHERE DATE_FORMAT(birthday_at, '%M') IN ('may', 'august');

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);

