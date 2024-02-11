/* warehouse a - Motorcycles & Planes 
   warehouse b - Classic Cars
   warehouse c - Vintage Cars
   warehouse d - Trucks and Buses, Ships and Trains */ 

CREATE INDEX idx_product_name ON products (productName);

SELECT productname,
       productline,
       warehousecode
FROM   products
GROUP  BY 1,2,3
ORDER  BY warehousecode,

          productLine
   
SELECT p.productline,
       p.warehousecode,
       p.quantityinstock,
       od.quantityordered,
       od.priceeach,
       ( od.quantityordered * od.priceeach ) AS total_sales
FROM   products p
       JOIN orderdetails od
         ON od.productcode = p.productcode
GROUP  BY p.productline,
          p.warehousecode,
          od.quantityordered
ORDER  BY p.warehousecode, total_sales DESC 


SELECT od.productcode,
       p.productline,
       p.productname,
       od.quantityordered
FROM   orderdetails od
       JOIN products p
         ON od.productcode = p.productcode
GROUP  BY od.productcode
ORDER  BY od.quantityordered 

/* Inventory Value or Holding costs*/
SELECT w.warehousename,
       Sum(p.quantityinstock * p.msrp) AS Total_Inventory_value
FROM   warehouses w
       RIGHT JOIN products p
               ON w.warehousecode = p.warehousecode
GROUP  BY w.warehousename 

/* ABC analysis - Top 20% of the total inventory value classified as category A, the next 30% as category B, and the remaining 50% as category C.*/
 WITH InventoryAnalysis AS (
    SELECT
        productLine,
        productCode,
        productVendor,
        MSRP,
        SUM(MSRP) OVER (ORDER BY MSRP DESC) AS cumulative_value,
        SUM(MSRP) OVER () AS total_value
    FROM
        products
)
SELECT
    productLine,
	productCode,
	productVendor,
	MSRP,
    total_value,
    CASE
        WHEN cumulative_value <= 0.2 * total_value THEN 'A'
        WHEN cumulative_value <= 0.5 * total_value THEN 'B'
        ELSE 'C'
    END AS category,
    (MSRP / total_value) * 100 AS percentage_of_total
FROM
    InventoryAnalysis;
    
/*Customers contributing the most to sales? How can sales efforts be focused on these valuable customers? */
SELECT o.customernumber,
       c.customername,
       Count(o.ordernumber) AS Number_of_orders_per_customers
FROM   orders o
       LEFT JOIN customers c
              ON o.customernumber = c.customernumber
GROUP  BY 1
ORDER  BY number_of_orders_per_customers DESC

/* Lead - Time Analysis - orders which are shipping in one day, their aim is to ship the products by next day*/
SELECT p.customernumber,
       o.ordernumber,
       o.orderdate,
       o.shippeddate,
       pr.productline,
       Datediff(o.shippeddate, o.orderdate) AS Lead_time
FROM   orders AS o
       JOIN payments AS p
         ON o.customernumber = p.customernumber
       JOIN orderdetails AS od
         ON o.ordernumber = od.ordernumber
       JOIN products AS pr
         ON pr.productcode = od.productcode
WHERE  ( o.shippeddate - o.orderdate ) > 2
GROUP  BY ordernumber,
          productline
ORDER  BY 6 DESC 

/*performance of various product lines and Which products are the most successful, and which ones need improvement or removal*/
SELECT p.productline,
       Sum(p.quantityinstock) AS
       Total_products_available,
       Sum(od.quantityordered) AS Total_sales,
       Sum(od.priceeach * od.quantityordered) AS Total_revenue,
       (Sum(od.quantityordered) / Sum(p.quantityinstock)) * 100 AS sales_to_inventory_ratio
FROM   products AS p
       LEFT JOIN productlines AS pl
              ON p.productline = pl.productline
       LEFT JOIN orderdetails AS od
              ON p.productcode = od.productcode
GROUP  BY 1
ORDER  BY 4,5 

/* Product Vendor Performance */
WITH AvgSales AS (
    SELECT AVG(quantityOrdered * priceEach) AS avg_sales
    FROM orderdetails
)
SELECT  p.productVendor,
		SUM(od.quantityOrdered * od.priceEach) AS total_sales
FROM orderdetails od
JOIN products p ON od.productcode = p.productcode
GROUP BY p.productVendor
HAVING total_sales > (SELECT avg_sales FROM AvgSales);

/* Demand Forecasting for different Product Lines */
SELECT EXTRACT(YEAR FROM o.orderDate) AS year,
       EXTRACT(MONTH FROM o.orderDate) AS month,
       AVG(od.quantityOrdered) AS avg_sales
FROM orders o
Join orderdetails od on o.orderNumber = od.orderNumber
GROUP BY year, month
ORDER BY year, month;
 
/* orders which are delayed more than 60 days due to exceeded customer's credit limit*/
SELECT p.customernumber,
       p.paymentdate,
       o.orderdate,
       o.requireddate,
       o.shippeddate,
       o.status,
       o.comments
FROM   orders o
       JOIN payments p
         ON o.customernumber = p.customernumber
WHERE  o.requireddate < o.shippeddate 

/* Slow - Moving Inventory (Products with high availability but low sales) */
SELECT p.productname,
       Sum(od.quantityordered) AS total_quantity_sold
FROM   products p
       JOIN orderdetails od
         ON p.productcode = od.productcode
       JOIN orders o
         ON od.ordernumber = o.ordernumber
GROUP  BY p.productname
HAVING total_quantity_sold <= 1000; 


















