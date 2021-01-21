-- 1. Содержит информацию о продажах, необходимую для построения отчетов 	
   CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `sales` AS
    SELECT 
        `r`.`name` AS `Ресторан`,
        `o`.`order_name` AS `Заказ`,
        `d`.`dish_name` AS `Блюдо`,
        `op`.`quantity` AS `Количество_блюд`,
        `op`.`price` AS `Цена`,
        `e`.`employee_name` AS `Кассир`
    FROM
        ((((`orders` `o`
        LEFT JOIN `restaurant` `r` ON ((`o`.`restaurant_id` = `r`.`id`)))
        JOIN `order_product` `op` ON ((`o`.`id` = `op`.`orders_id`)))
        LEFT JOIN `dishes` `d` ON ((`op`.`dishes_id` = `d`.`id`)))
        JOIN `empoloyees` `e` ON ((`o`.`empoloyees_id` = `e`.`id`)));
        
        
-- 2. Для учета рабочего времени сотрудников
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `work_time` AS
    SELECT 
        `r`.`name` AS `Ресторан`,
        `e`.`code` AS `Код`,
        `e`.`employee_name` AS `Сотрудник`,
        `e`.`phone` AS `Телефон`,
        `e`.`e-mail` AS `Почта`,
        `e`.`address` AS `Адрес`,
        `c`.`start_time` AS `Начало_смены`,
        `c`.`end_time` AS `Окончание_смены`,
        `c`.`delay` AS `Время_опаздания`
    FROM
        ((`clockreck` `c`
        LEFT JOIN `empoloyees` `e` ON ((`c`.`empoloyees_id` = `e`.`id`)))
        LEFT JOIN `restaurant` `r` ON ((`c`.`restaurant_id` = `r`.`id`)))