-- Предназначена для розыгрыша подарков, выберает случайным образом клиета с активной картой скидок
-- для награждения подарком в праздники, в рамках проводимых акций

REATE DEFINER=`root`@`localhost` PROCEDURE `psdcards`()
BEGIN
	SELECT 
		psdcards.`code`,
		psdcards.client_name,psdcardsclockreckclockreck
		psdcards.phone,
		psdcards.`e-mail`,
		psdcards.address,
		psdcards.`locked`,
		discounts.discount_name,
		discounts.percent
	FROM psdcards
	LEFT JOIN discounts ON psdcards.discounts_id = discounts.id
	WHERE psdcards.`locked` = 0 
	ORDER BY rand()
	LIMIT 1;
END;
	
CALL  psdcards(); 

-- Выберает клиетов с просроченной дисконтной картой для дальнейшей отправки сообщений о необходимости замены.

CREATE DEFINER=`root`@`localhost` PROCEDURE `limit`()
BEGIN
	SELECT 
		psdcards.`code`,
		psdcards.client_name,
		psdcards.phone,
		psdcards.`e-mail`,
		psdcards.address,
		psdcards.`locked`,
		discounts.discount_name,
		discounts.percent
	FROM psdcards
	LEFT JOIN discounts ON psdcards.discounts_id = discounts.id
	WHERE psdcards.`locked` = 1 
	ORDER BY discounts.percent;
END;
	
CALL  limit_psdcards(); 


  