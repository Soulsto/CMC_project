SELECT AVG(orderLineNumber) 
FROM orderdetails AS od
JOIN orders AS o ON od.orderNumber = o.orderNumber
WHERE orderDate BETWEEN '2022-01-01' AND '2022-12-31' ;