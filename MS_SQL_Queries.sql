-- Chapter 1

ALTER TABLE Main
ALTER COLUMN Order_Date DATE
GO
ALTER TABLE Main
ALTER COLUMN Estimated_Delivery_Date DATE
GO
ALTER TABLE Main
ALTER COLUMN Order_Quantity INT
GO

SELECT TOP 5
    Product_Name,
    SUM(Order_Quantity) AS Total_Ordered_Quantity
FROM Main
GROUP BY Product_Name, Order_Quantity
ORDER BY Total_Ordered_Quantity DESC

SELECT
COUNT(Product_Subcategory) AS Subcategories_Total
FROM(
	SELECT
	*
	FROM Main
	WHERE Product_Category = 'Road Bikes') AS Subquery
GROUP BY Product_Subcategory
HAVING Product_Subcategory = 'Endurance'


-- Chapter 2


SELECT
    FORMAT(SUM(Order_Total), 'C', 'en-US') AS 'Total by color',
    ROUND(AVG(Product_Price),2) AS 'Average product price',
    product_color
FROM Main
WHERE Product_Region IN ('Europe', 'Asia') 
GROUP BY product_color 
HAVING AVG(Product_Price) > 1700
GO

SELECT TOP 5
    product_color,
    product_name,
    Order_Total,
    RANK() OVER (PARTITION BY product_color ORDER BY Order_Total DESC) AS 'Rank by total'  
FROM Main
WHERE Product_Region IN ('Europe', 'Asia')
ORDER BY Order_Total DESC;


-- Chapter 3

CREATE TABLE Best_Bikes (
    product_color NCHAR(50),
    product_name NCHAR(100)
)

INSERT INTO Best_Bikes (Product_Color, Product_Name)
VALUES
(N'Purple', N'DownhillDominator 8000'),
(N'Orange', N'AeroSpeed 1000'),
(N'Purple', N'DownhillDominator 7000'),
(N'Black', N'DownhillDominator 5000'),
(N'Blue', N'E-TrailBlazer 1000');


SELECT
bb.product_name,
m.product_subcategory
FROM Main m
LEFT JOIN Best_Bikes bb
ON m.product_name = bb.product_name
WHERE bb.product_name IS NOT NULL

SELECT 
    COALESCE(m.Product_Name, bb.Product_Name) AS Product_Name,
    CASE 
        WHEN m.Product_Name IS NOT NULL AND bb.Product_Name IS NOT NULL THEN 'yes'
        WHEN m.Product_Name IS NOT NULL AND bb.Product_Name IS NULL THEN 'no'
        WHEN m.Product_Name IS NULL AND bb.Product_Name IS NOT NULL THEN 'only in best'
    END AS Status
FROM Main AS m
FULL OUTER JOIN Best_Bikes AS bb
    ON m.Product_Name = bb.Product_Name
ORDER BY 
    CASE 
        WHEN m.Product_Name IS NULL AND bb.Product_Name IS NOT NULL THEN 1
        WHEN m.Product_Name IS NOT NULL AND bb.Product_Name IS NOT NULL THEN 2
        WHEN m.Product_Name IS NOT NULL AND bb.Product_Name IS NULL THEN 3
    END

