# DATA CLEANING


select * from beautyglow_sales;

-- Check for Null Values

Select 
COUNT(*) AS total_rows,
SUM(CASE WHEN `Date` IS NULL THEN 1 ELSE 0 END) AS null_date,
SUM(CASE WHEN `Product` IS NULL THEN 1 ELSE 0 END) AS null_product,
SUM(CASE WHEN `Category` IS NULL THEN 1 ELSE 0 END) AS null_category,
SUM(CASE WHEN `UnitsSold` IS NULL THEN 1 ELSE 0 END) AS null_UnitsSold,
SUM(CASE WHEN `UnitPrice` IS NULL THEN 1 ELSE 0 END) AS null_UnitPrice,
SUM(CASE WHEN `Revenue` IS NULL THEN 1 ELSE 0 END) AS null_revenue,
SUM(CASE WHEN `PromoUsed` IS NULL THEN 1 ELSE 0 END) AS null_PromoUsed,
SUM(CASE WHEN `Channel` IS NULL THEN 1 ELSE 0 END) AS null_channel,
SUM(CASE WHEN `CustomerID` IS NULL THEN 1 ELSE 0 END) AS null_customer_ID
from beautyglow_sales;



-- Check for Duplicates

	SELECT 
    `date`,
    product,
    category,
    UnitsSold,
    UnitPrice,
    Revenue,
    PromoUsed,
    `Channel`,
    CustomerID,
    COUNT(*) AS dup_count
FROM
    beautyglow_sales
GROUP BY `date` , product , category , unitssold , unitprice , revenue , promoUsed , `channel` , customerid
HAVING COUNT(*) > 1;



-- Check for Invalid Values

SELECT *
FROM beautyglow_sales
WHERE unitsSold <= 0;

SELECT *
FROM beautyglow_sales
WHERE unitprice <= 0;

SELECT *
FROM beautyglow_sales
WHERE revenue < 0;

SELECT *
FROM beautyglow_sales
WHERE date > CURDATE();

SELECT *
FROM beautyglow_sales
WHERE date IS NULL;
  

SELECT DISTINCT category
FROM beautyglow_sales;

SELECT DISTINCT category
FROM beautyglow_sales
WHERE LOWER(category) NOT IN ('skincare', 'makeup', 'haircare');

UPDATE beautyglow_sales
SET category = CASE
    WHEN LOWER(category) LIKE '%skin%' THEN 'skincare'
    WHEN LOWER(category) LIKE '%make%' THEN 'makeup'
    WHEN LOWER(category) LIKE '%hair%' THEN 'haircare'
    ELSE category -- leave as is for now, to review later
END;


SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;


-- Validate Calculated Columns

SELECT *
FROM beautyglow_sales
WHERE ABS(revenue - (unitssold * unitprice)) > 0.01;

-- Check column data types

DESCRIBE beautyglow_sales;

select * from beautyglow_sales;



