SELECT SUM((priceEach - buyPrice) * quantityOrdered) AS produit_plus_rentable , productLine
FROM products as p
JOIN orderdetails AS od ON od.productCode = p.productCode
JOIN orders AS o ON o.orderNumber = od.orderNumber 
WHERE orderDate BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY productLine
ORDER BY produit_plus_rentable DESC ;