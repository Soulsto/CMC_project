SELECT  productLine,product_number,(product_number - previous_sales) AS comparison,rate_of_change,CONCAT(t_month,"/",t_year) AS t_month_year,CONCAT((t_month),"/",((t_year-1))), t_month
FROM
( SELECT p.productLine, SUM(o.quantityOrdered) AS product_number,LAG(SUM(o.quantityOrdered),12) OVER(PARTITION BY p.productLine ORDER BY YEAR(orders.orderDate)) as previous_sales, ((SUM(o.quantityOrdered)-LAG(SUM(o.quantityOrdered),12) OVER(PARTITION BY p.productLine ORDER BY YEAR(orders.orderDate)))/LAG(SUM(o.quantityOrdered),12) OVER(PARTITION BY p.productLine ORDER BY YEAR(orders.orderDate))) *100 AS rate_of_change,MONTH(orders.orderDate) AS t_month,YEAR(orders.orderDate) AS t_year
FROM products as p
INNER JOIN orderdetails as o
ON p.productCode = o.productCode
INNER JOIN orders
ON o.orderNumber = orders.orderNumber
GROUP BY p.productLine,MONTH(orders.orderDate),YEAR(orders.orderDate) )AS subquery 
WHERE (product_number - previous_sales) IS NOT NULL and rate_of_change IS NOT NULL;