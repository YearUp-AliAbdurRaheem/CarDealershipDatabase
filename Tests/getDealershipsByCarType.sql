USE Dealerships;

SELECT DISTINCT *
FROM dealerships
JOIN inventory ON dealerships.dealership_id = inventory.dealership_id
JOIN vehicles ON inventory.VIN = vehicles.vin
WHERE vehicles.make = 'Tesla'
AND vehicles.model = 'Roadster'
AND vehicles.color = 'Red';
