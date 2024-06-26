SELECT AVG(orderLineNumber) 
FROM orderdetails AS od
JOIN orders AS o ON od.orderNumber = o.orderNumber
WHERE orderDate BETWEEN '2023-01-01' AND '2023-12-31' ;