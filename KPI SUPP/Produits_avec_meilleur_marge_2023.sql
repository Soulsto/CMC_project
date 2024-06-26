SELECT SUM((priceEach - buyPrice) * quantityOrdered) AS produit_plus_rentable , productName
FROM products as p
JOIN orderdetails AS od ON od.productCode = p.productCode
JOIN orders AS o ON o.orderNumber = od.orderNumber 
WHERE orderDate BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY productName
ORDER BY produit_plus_rentable DESC LIMIT 5;