SELECT p.customerNumber, customerName, country
FROM customers AS c
LEFT JOIN payments AS p ON c.customerNumber = p.customerNumber
WHERE p.customerNumber IS NULL
GROUP BY p.customerNumber, c.customerNumber
ORDER BY country