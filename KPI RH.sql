SELECT lastName, firstName, Mois, total_amount
FROM (
    SELECT
        Mois,
        salesRepEmployeeNumber,
        total_amount,
        ROW_NUMBER() OVER (PARTITION BY Mois ORDER BY total_amount DESC) AS rank_vendeur
    FROM (SELECT sum(amount) AS total_amount,salesRepEmployeeNumber, DATE_FORMAT(payments.paymentDate, '%Y-%m') AS Mois
FROM payments
LEFT JOIN customers ON customers.customerNumber = payments.customerNumber
GROUP BY Mois,salesRepEmployeeNumber
ORDER BY total_amount DESC)AS Rang) AS rang
RIGHT JOIN employees ON salesRepEmployeeNumber = employeeNumber
WHERE   rank_vendeur <= 2
ORDER BY Mois, total_amount DESC;