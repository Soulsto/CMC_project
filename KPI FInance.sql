SELECT SUM(quantityOrdered * priceEach) AS Turnover, customers.country
FROM `orders`
INNER JOIN `customers` ON customers.customerNumber = orders.customerNumber
INNER JOIN `orderdetails`ON orderdetails.orderNumber = orders.orderNumber 
WHERE orderDate BETWEEN ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 3 MONTH)), 1) AND LAST_DAY(DATE_SUB(CURDATE(), INTERVAL 1 MONTH)) 
GROUP BY customers.country
ORDER BY Turnover ;
