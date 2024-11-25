# Dealership Database Management System

## Overview
This project is a comprehensive database management system designed for car dealerships. It allows for the management of dealerships, vehicles, inventory, sales contracts, and lease contracts. 

The system is built using SQL and includes [tests](Tests).

## Features
- **Database Creation**: Automatically creates a new database for managing dealership data.
- **Table Management**: Includes tables for dealerships, vehicles, inventory, sales contracts, and lease contracts.
- **Data Integrity**: Uses foreign keys to maintain relationships between tables, ensuring that all data entries are valid and consistent.
- **Sample Data**: Pre-populated with sample dealerships, vehicles, and contracts for testing and demonstration purposes.

## Database Structure
The database consists of the following tables:
- **Dealerships**: Stores information about each dealership, including name, address, and phone number.
- **Vehicles**: Stores information about each vehicle, including VIN, make, model, year, price, vehicle type, color, odometer reading, and a flag indicating if the vehicle has been sold.
- **Inventory**: Links dealerships to their available vehicles, ensuring unique dealership-VIN combinations.
- **SalesContracts**: Records details of vehicle sales, including customer information and vehicle details.
- **LeaseContracts**: Manages lease agreements for vehicles, including terms and customer details.

## Interesting Feature
One notable aspect of this database is the use of foreign keys, such as `FOREIGN KEY (vin) REFERENCES vehicles(vin)`. 

This ensures that any vehicle sold through a sales contract must exist in the vehicles table, maintaining data integrity and preventing errors in sales records.

## Getting Started
To set up the database, run the [`Main.sql`](Main.sql) script in your MySQL Workbench. This will create the database and all necessary tables, along with sample data for testing.

<span style="color: red;">**WARNING: THIS WILL OVERWITE ANY DATABASE NAMED "Dealerships"!**</span>

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.