USE Dealerships;

SELECT *
FROM vehicles
JOIN inventory ON vehicles.vin = inventory.VIN
WHERE inventory.dealership_id = 1;
