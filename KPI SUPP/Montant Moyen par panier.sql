SELECT SUM(priceEach * quantityOrdered) AS montant,  DATE_FORMAT(o.orderDate, '%Y') AS Year
FROM orderdetails AS od
JOIN orders AS o ON od.orderNumber = o.orderNumber
WHERE orderDate BETWEEN '2022-01-01' AND '2024-12-31' 
GROUP BY o.orderDate;