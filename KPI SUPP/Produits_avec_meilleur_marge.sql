SELECT SUM((priceEach - buyPrice) * quantityOrdered) AS produit_plus_rentable , productName, DATE_FORMAT(o.orderDate, '%Y') AS Year
FROM products as p
JOIN orderdetails AS od ON od.productCode = p.productCode
JOIN orders AS o ON o.orderNumber = od.orderNumber 
WHERE orderDate BETWEEN '2022-01-01' AND '2024-12-31' AND (DATE_FORMAT(o.orderDate, '%Y') = 2024 OR DATE_FORMAT(o.orderDate, '%Y') = 2023 OR DATE_FORMAT(o.orderDate, '%Y') = 2022)
GROUP BY productName, o.orderDate
ORDER BY produit_plus_rentable DESC LIMIT 100;