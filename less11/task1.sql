-- Создайте таблицу logs типа Archive. Пусть при каждом создании записи 
-- в таблицах users, catalogs и products в таблицу logs помещается время 
-- и дата создания записи, название таблицы, идентификатор первичного ключа и 
-- содержимое поля name.
use shop;

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
	created_at DATETIME NOT NULL,
	`name` VARCHAR(100) NOT NULL,
	id_key BIGINT NOT NULL,
	name_value VARCHAR(200) NOT NULL
) ENGINE = ARCHIVE;

DROP TRIGGER IF EXISTS tr_users;
delimiter //
CREATE TRIGGER tr_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, `name`, id_key, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //
delimiter ;

DROP TRIGGER IF EXISTS tr_catalogs;
delimiter //
CREATE TRIGGER tr_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, `name`, id_key, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //
delimiter ;

DROP TRIGGER IF EXISTS tr_products;
delimiter //
CREATE TRIGGER tr_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, `name`, id_key, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
delimiter ;
