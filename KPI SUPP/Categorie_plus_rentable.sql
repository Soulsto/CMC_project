SELECT SUM((priceEach - buyPrice) * quantityOrdered) AS produit_plus_rentable , productLine,DATE_FORMAT(o.orderDate, '%Y') AS Year
FROM products as p
JOIN orderdetails AS od ON od.productCode = p.productCode
JOIN orders AS o ON o.orderNumber = od.orderNumber 
WHERE orderDate BETWEEN '2022-01-01' AND '2024-12-31'
GROUP BY productLine, Year
ORDER BY produit_plus_rentable DESC ;