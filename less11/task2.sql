-- Создайте SQL-запрос, который помещает в таблицу users миллион записей.

use shop;

DROP PROCEDURE IF EXISTS pr_users ;
delimiter //
CREATE PROCEDURE pr_users ()
BEGIN
	DECLARE i INT DEFAULT 1;
	WHILE i <= 10000000 DO
		INSERT INTO users(`name`, birthday_at) VALUES (CONCAT('user_', j), NOW());
		SET i = i + 1;
	END WHILE;
END //
delimiter ;