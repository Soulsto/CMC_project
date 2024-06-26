SELECT SUM(quantityOrdered) AS nb_produit, o.orderNumber,  DATE_FORMAT(o.orderDate, '%m-%Y') AS Year
FROM orderdetails AS od
JOIN orders AS o ON od.orderNumber = o.orderNumber
WHERE orderDate BETWEEN '2022-01-01' AND '2024-12-31' 
GROUP BY o.orderNumber;