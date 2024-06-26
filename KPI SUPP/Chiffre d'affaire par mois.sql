SELECT SUM(quantityOrdered * priceEach) AS Chiffre_affaire_par_mois, DATE_FORMAT(o.orderDate, '%Y-%m') AS Mois
FROM orderdetails AS od
JOIN orders AS o ON od.orderNumber = o.orderNumber 
WHERE orderdate BETWEEN '2022-01-01' AND '2024-12-31'
GROUP BY Mois ;