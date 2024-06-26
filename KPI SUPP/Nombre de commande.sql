SELECT COUNT(orderNumber), DATE_FORMAT(o.orderDate, '%Y-%m') AS Mois
FROM orders as o
GROUP BY Mois