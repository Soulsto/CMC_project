SELECT AVG(shippedDate - orderDate), DATE_FORMAT(orderDate, '%Y') AS Year
FROM orders
WHERE (shippedDate - orderDate) < 31 AND orderDate BETWEEN '2022-01-01' AND '2024-12-31'
GROUP BY orderDate;