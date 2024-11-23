USE Dealerships;

SELECT *
FROM SalesContracts
JOIN inventory ON SalesContracts.vin = inventory.VIN
WHERE inventory.dealership_id = 1
AND date BETWEEN '2017-01-01' AND '2024-01-31';
