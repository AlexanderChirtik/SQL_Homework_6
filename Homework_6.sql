CREATE DATABASE home_work_6;
USE home_work_6;

-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд

DROP FUNCTION IF EXISTS time_count;
DELIMITER |
CREATE FUNCTION time_count(seconds_input INT)
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
	DECLARE days, hours, minutes, seconds VARCHAR(3);
	DECLARE result VARCHAR(50);
	SET days = FLOOR(seconds_input/60/60/24);
	SET hours = FLOOR(MOD(seconds_input/60/60/24,1)*24);
	SET minutes = FLOOR(MOD(MOD(seconds_input/60/60/24,1)*24,1)*60);
	SET seconds = FLOOR(MOD(MOD(MOD(seconds_input/60/60/24,1)*24,1)*60,1)*60 +1);
  set result = concat("Получилось ", days,' дней ',hours,' часов ',minutes,' минут ',seconds,' секунд');
RETURN result;
END |


SELECT time_count(120);



-- 2. Выведите только четные числа от 1 до 10 (Через цикл).

DROP PROCEDURE IF EXISTS print_numbers;
DELIMITER $$
CREATE PROCEDURE print_numbers()
BEGIN
DECLARE n INT DEFAULT 2; 
DECLARE result VARCHAR(45) DEFAULT "";

REPEAT
SET result = CONCAT(result, n,",");
SET n = n + 2;

UNTIL n > 10 
END REPEAT;
SELECT TRIM(TRAILING "," FROM result) AS result;
END $$

CALL print_numbers(); 



		