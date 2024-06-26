SELECT shippedDate - requiredDate, orderNumber
FROM orders
WHERE shippedDate - requiredDate > 0