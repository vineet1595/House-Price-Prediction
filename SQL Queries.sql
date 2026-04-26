CREATE DATABASE IF NOT EXISTS bangalore_project;
USE bangalore_project;
SELECT DATABASE();
USE bangalore_project;

CREATE TABLE IF NOT EXISTS houses (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    area_type    VARCHAR(100),
    availability VARCHAR(100),
    location     VARCHAR(200),
    size         VARCHAR(50),
    society      VARCHAR(200),
    total_sqft   VARCHAR(50),
    bath         FLOAT,
    balcony      FLOAT,
    price        FLOAT
);

-- Checking the data

USE bangalore_project;
SELECT * FROM houses LIMIT 5;

-- Counting houses by area type

SELECT   area_type, COUNT(*) AS total_houses
FROM houses
GROUP BY area_type
ORDER BY total_houses DESC;

-- Average, min, max price by area type

SELECT area_type,ROUND(AVG(price), 2) AS avg_price_lakhs,
	ROUND(MIN(price), 2) AS min_price_lakhs,
	ROUND(MAX(price), 2) AS max_price_lakhs
FROM houses
GROUP BY area_type
ORDER BY avg_price_lakhs DESC;

-- Top 10 most expensive locations

SELECT   location,
	COUNT(*) AS total_listings,
	ROUND(AVG(price), 2) AS avg_price_lakhs
FROM houses
WHERE price IS NOT NULL
GROUP BY location
HAVING total_listings >= 10
ORDER BY avg_price_lakhs DESC
LIMIT 10;

-- Count missing values per column

SELECT
    SUM(location IS NULL) AS location_missing,
    SUM(size IS NULL) AS size_missing,
    SUM(society IS NULL) AS society_missing,
    SUM(bath IS NULL) AS bath_missing,
    SUM(balcony IS NULL) AS balcony_missing
FROM houses;

----

SELECT model, MAE, RMSE, R2, model_used, is_winner 
FROM model_results
ORDER BY R2 DESC;









