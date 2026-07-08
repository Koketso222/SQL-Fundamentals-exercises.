-- Databricks notebook source
SELECT *
FROM retail.retail_sales.1782214138464_bright_tv_dataset;

--Checking what the given data looks like
---------------------------------------------------------------------------
select * 
from `retail`.`retail_sales`.`1782214138464_bright_tv_dataset`
limit 5;
---------------------------------------------------------------------------
-- Gender checks
---------------------------------------------------------------------------

SELECT DISTINCT gender
FROM `retail`.`retail_sales`.`1782214138464_bright_tv_dataset`;

SELECT DISTINCT
CASE
WHEN gender = 'None' THEN 'unknown'
WHEN gender = ' ' THEN 'unknown'
WHEN gender IS NULL THEN 'unknown'
ELSE gender
END AS sex
FROM `retail`.`retail_sales`.`1782214138464_bright_tv_dataset`;
-----------------------------------------------------------------------
-- Race check
-----------------------------------------------------------------------
SELECT DISTINCT race
FROM `retail`.`retail_sales`.`1782214138464_bright_tv_dataset`;

SELECT COUNT(DISTINCT userid) AS subs,
CASE
WHEN race = 'other' THEN 'unknown'
WHEN race = 'None' THEN 'unknown'
WHEN race = ' ' THEN 'unknown'
WHEN race IS NULL THEN 'unknown'
ELSE race
END AS enthnicy
FROM `retail`.`retail_sales`.`1782214138464_bright_tv_dataset`
GROUP BY enthnicy;
---------------------------------------------------------------------
-- Province checks
---------------------------------------------------------------------
SELECT DISTINCT Province
FROM `retail`.`retail_sales`.`1782214138464_bright_tv_dataset`;

SELECT DISTINCT
CASE
WHEN Province = 'None' THEN 'Unknown'
WHEN Province = ' ' THEN 'Unknown'
WHEN Province IS NULL THEN 'Unknown'
ELSE Province
END AS Region
FROM  `retail`.`retail_sales`.`1782214138464_bright_tv_dataset`;
---------------------------------------------------------------------
-- Age checks
---------------------------------------------------------------------
SELECT MIN(Age) AS min_age,
MAX(Age) AS max_age,
AVG(Age) AS mean_age
FROM  `retail`.`retail_sales`.`1782214138464_bright_tv_dataset`;

SELECT
CASE
WHEN Age = 0 THEN 'Infant'
WHEN Age BETWEEN 1 AND 12 THEN 'Kids'
WHEN Age BETWEEN 13 AND 19 THEN 'Youth'
WHEN Age BETWEEN 18 AND 36 THEN 'Young Adult'
WHEN Age BETWEEN 36 AND 50 THEN 'Adults'
WHEN Age > 50 AND AGE <=60  THEN 'Elder'
WHEN Age > 60 THEN 'Pensioner'
END AS Age_group
FROM `retail`.`retail_sales`.`1782214138464_bright_tv_dataset`;

---------------------------------------------------------------------
SELECT
UserID,

CASE 
WHEN (EMAIL IS NOT NULL) OR (EMAIL<>' ') OR (EMAIL NOT IN ('None', 'other')) THEN 1
ELSE 0
END AS email_flag,

CASE 
WHEN (`Social Media Handle`IS NOT NULL) OR (`Social Media Handle`<>' ') OR (`Social Media Handle` NOT IN ('None', 'other')) THEN 1
ELSE 0
END AS socialmedia_flag,

CASE
WHEN gender = 'None' THEN 'unknown'
WHEN gender = ' ' THEN 'unknown'
WHEN gender IS NULL THEN 'unknown'
ELSE gender
END AS sex,

CASE
WHEN race = 'other' THEN 'unknown'
WHEN race = 'None' THEN 'unknown'
WHEN race = ' ' THEN 'unknown'
WHEN race IS NULL THEN 'unknown'
ELSE race
END AS enthnicy,

CASE
WHEN Province = 'None' THEN 'Unknown'
WHEN Province = ' ' THEN 'Unknown'
WHEN Province IS NULL THEN 'Unknown'
ELSE Province
END AS Region,

CASE
 WHEN Age = 0 THEN '01.Infant: 0'
WHEN Age BETWEEN 1 AND 12 THEN '02.Kids: 1 - 12'
WHEN Age BETWEEN 13 AND 19 THEN '03.Youth: 13 - 17'
WHEN Age BETWEEN 18 AND 36 THEN '04.Young Adult: 18 - 35'
WHEN Age BETWEEN 36 AND 50 THEN '05.Adults: 36 - 50'
WHEN Age > 50 AND AGE <=60  THEN 'Elder: 51 - 60'
WHEN Age > 60 THEN '07.Pensioner: >60'
END AS Age_group

FROM `retail`.`retail_sales`.`1782214138464_bright_tv_dataset`;


------------------------------------------------------------------------

