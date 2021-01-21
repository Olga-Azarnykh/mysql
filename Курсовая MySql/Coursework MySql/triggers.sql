-- Триггеры обновляют данные в таблице clockreck (учет рабочего времени)

CREATE DEFINER=`root`@`localhost` TRIGGER `clockreck_BEFORE_INSERT` BEFORE INSERT ON `clockreck` FOR EACH ROW BEGIN
	IF NEW.start_time > now() THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Err: No new entries';
     END IF;   
END;

CREATE DEFINER=`root`@`localhost` TRIGGER `clockreck_BEFORE_UPDATE` BEFORE UPDATE ON `clockreck` FOR EACH ROW BEGIN
IF NEW.start_time > now() THEN
		SET NEW.start_time = OLD.start_time;
    END IF; 
END