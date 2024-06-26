SELECT SUM(quantityOrdered) as quantite, DATE_FORMAT(o.orderDate, '%Y-%m') AS Mois
FROM orderdetails as od
JOIN orders as o ON o.orderNumber = od.orderNumber
GROUP BY Mois