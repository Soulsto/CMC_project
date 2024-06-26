SELECT quantityInStock AS quantite_en_stock, SUM(quantityOrdered) AS quantite_commandee, productName, (quantityInStock - SUM(quantityOrdered)) AS difference_commande_stock
FROM products AS p
JOIN orderdetails AS od ON p.productCode = od.productCode
JOIN orders AS o ON o.orderNumber = od.orderNumber  
WHERE orderDate BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY p.ProductCode
ORDER BY difference_commande_stock DESC;