USE Dealerships;

SELECT *
FROM dealerships
JOIN inventory ON dealerships.dealership_id = inventory.dealership_id
WHERE inventory.VIN = 482736;
