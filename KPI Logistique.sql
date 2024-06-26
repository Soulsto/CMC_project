SELECT quantityInStock AS quantite_en_stock, SUM(quantityOrdered) AS quantite_commandee, productName
FROM products AS p
JOIN orderdetails AS od ON p.productCode = od.productCode
JOIN orders AS o ON o.orderNumber = od.orderNumber  
GROUP BY p.ProductCode
ORDER BY quantite_commandee DESC
LIMIT 5;