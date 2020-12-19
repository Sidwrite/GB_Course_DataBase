-- 1. Создайте двух пользователей которые имеют доступ к базе данных shop. Первому пользователю shop_read должны быть доступны только запросы на чтение данных, второму пользователю shop — любые операции в пределах базы данных shop.

-- Создание пользователя shop_read с правами на чтение данных

DROP USER IF EXISTS 'shop_reader'@'localhost';
CREATE USER 'shop_reader'@'localhost' IDENTIFIED WITH sha256_password BY 'qwerty123';
GRANT SELECT ON shop_online.* TO 'shop_reader'@'localhost';

-- Создание пользователя shop с полными правами в БД shop
DROP USER IF EXISTS 'shop'@'localhost';
CREATE USER 'shop'@'localhost' IDENTIFIED WITH sha256_password BY 'qwerty123';
GRANT ALL ON shop_online.* TO 'shop'@'localhost';
GRANT GRANT OPTION ON shop_online.* TO 'shop'@'localhost';

-- 2. 	(по желанию) Пусть имеется таблица accounts содержащая три столбца id, name, password, содержащие первичный ключ, имя пользователя и его пароль. Создайте представление username таблицы accounts, предоставляющий доступ к столбца id и name. Создайте пользователя user_read, который бы не имел доступа к таблице accounts, однако, мог бы извлекать записи из представления username.

DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
	id SERIAL PRIMARY KEY,
	name VARCHAR(45),
	password VARCHAR(45)
);

INSERT INTO accounts VALUES
	(NULL, 'Ivan', 'qwert123'),
	(NULL, 'Igor', 'fdsgdfg123'),
	(NULL, 'Petr', 'salyut13'),
	(NULL, 'Sergey', 'srgdfsg5');


CREATE OR REPLACE VIEW username_view(user_id, user_name) AS 
	SELECT id, name FROM accounts;


DROP USER IF EXISTS 'shop_reader'@'localhost';
CREATE USER 'shop_reader'@'localhost' IDENTIFIED WITH sha256_password BY 'qwerty123';
GRANT SELECT ON shop_online.username_view TO 'shop_reader'@'localhost';
