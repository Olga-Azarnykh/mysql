-- 1. Рейтинг блюд 
-- Вывести количество блюд по каждому ресторану, отсортировать в порядке убывания (от большего к меньшему) 

SELECT 
    R.`name` Ресторан,
    D.dish_name Блюдо,
    sum(OP.quantity) Количество_блюд
FROM 
	orders O
	LEFT JOIN restaurant R ON O.restaurant_id = R.id
	JOIN order_product OP ON O.id = OP.orders_id
	LEFT JOIN dishes D ON OP.dishes_id = D.id
GROUP BY 
    R.`name`,
    D.dish_name
ORDER BY 1, 3 desc;

-- 2. Найти сотрудников, чаще всего опаздывающих на работу, 
--    вывести сотрудника, опаздавшего больше других
SELECT 
	R.`name` Ресторан,
    E.employee_name Сотрудник,
    C.delay Время_опаздания
FROM 
	clockreck C
	LEFT JOIN empoloyees E ON C.empoloyees_id = E.id
	LEFT JOIN restaurant R ON C.restaurant_id = R.id
WHERE C.lateness <> 0
ORDER BY 3 desc LIMIT 1;

-- 3. Скидки 
-- Вывести покупателя, его номер телефона, карту, ее статус процент скидки,
-- Показать покупателей с самым большим процентом скидки и не заблокированной картой 
SELECT 
	 tab_client.client_name,
	 tab_client.phone,
	 tab_client.code_psdcards,
	 tab_client.percent
FROM (SELECT
	PS.client_name client_name,
	PS.phone phone, 
	PS.`code` code_psdcards, 
	DS.percent percent,
	PS.`locked` locked_cards
		FROM
		order_product OP
		LEFT JOIN psdcards PS ON OP.psdcards_id = PS.id
		LEFT JOIN discounts DS ON PS.discounts_id = DS.id
		GROUP BY 
			PS.client_name,
			PS.phone,
			PS.`code`, 
			DS.percent
		HAVING PS.`locked` <> 1
		 ) tab_client
WHERE tab_client.percent > 40;
