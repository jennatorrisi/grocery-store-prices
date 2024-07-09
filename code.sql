--Created a CTE to obtain median values for WEIGHT and PRICE, decimals rounded to 2 decimal places
WITH MedianValues AS (
    SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY CAST(REPLACE(weight, ' grams', '') AS DECIMAL(10, 2))) AS median_weight,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price) AS median_price
    FROM products
	)
-- Replaced null values in product_type
SELECT product_id, COALESCE(product_type, 'Unknown') AS product_type,
-- Replaced null values in 'brand'
REGEXP_REPLACE(brand, '-', 'Unknown', 'g') AS brand,
-- Converted string values in weight column to decimal
CASE WHEN weight LIKE '%grams' THEN 
    CAST(REPLACE(weight, ' grams', '') AS DECIMAL(10, 2))
    ELSE CAST(weight AS DECIMAL(10, 2)) END 
	AS weight,
-- Replaced null values with median price as created in CTE
COALESCE(CAST(price AS DECIMAL(10, 2)), median_price) AS price,
-- Replaced null values with "0"
COALESCE(average_units_sold, '0') AS average_units_sold,
--Replace null values in year added with "2022"
COALESCE(year_added, '2022') AS year_added,
-- Replaced null values and capitalized Stock Location
INITCAP(COALESCE(stock_location, 'Unknown')) AS stock_location
FROM products
-- Joined Main Query to CTE
LEFT JOIN MedianValues ON 1=1;
