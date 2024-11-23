# ------------------------------------------------------------ #
#                Droping old Database if exists                #
# ------------------------------------------------------------ #
DROP DATABASE IF EXISTS Dealerships;

# ------------------------------------------------------------ #
#                    Creating new Database                     #
# ------------------------------------------------------------ #
CREATE DATABASE Dealerships;

# ------------------------------------------------------------ #
#                   Adding dealerships table                   #
# ------------------------------------------------------------ #
USE Dealerships;

CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY
    , name VARCHAR(50)
    , address VARCHAR(50)
    , phone VARCHAR(12)
);

# ------------------------------------------------------------ #
#                   Adding vehicles table                      #
# ------------------------------------------------------------ #
CREATE TABLE vehicles (
    vin DECIMAL(6, 0) PRIMARY KEY  -- vin is a 6-digit number
    , year INT
    , make VARCHAR(50)
    , model VARCHAR(50)
    , vehicle_type VARCHAR(50)
    , color VARCHAR(50)
    , odometer BIGINT
    , price DECIMAL(10, 2)
    , sold BOOLEAN DEFAULT FALSE
);

# ------------------------------------------------------------ #
#                   Adding inventory table                     #
# ------------------------------------------------------------ #
CREATE TABLE inventory (
    dealership_id INT
    , VIN DECIMAL(6, 0)
    , PRIMARY KEY (dealership_id, VIN) -- Ensures each dealership-VIN combination is unique
);

# ------------------------------------------------------------ #
#                   Adding SalesContracts table                #
# ------------------------------------------------------------ #
CREATE TABLE SalesContracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE
    , customer_name VARCHAR(100)
    , customer_email VARCHAR(100)
    , vin DECIMAL(6,0)
    , vehicle_year INT
    , make VARCHAR(50)
    , model VARCHAR(50)
    , vehicle_type VARCHAR(50)
    , color VARCHAR(50)
    , odometer BIGINT
    , vehicle_price DECIMAL(12,2)
    , sales_tax DECIMAL(12,2)
    , recording_fee DECIMAL(12,2)
    , processing_fee DECIMAL(12,2)
    , total_price DECIMAL(12,2)
    , is_financed BOOLEAN
    , monthly_payment DECIMAL(12,2)
    , FOREIGN KEY (vin) REFERENCES vehicles(vin) -- Ensures the vehicle exists in inventory before it can be sold
);

# ------------------------------------------------------------ #
#                   Adding LeaseContracts table                #
# ------------------------------------------------------------ #
CREATE TABLE LeaseContracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY
    , date DATE
    , customer_name VARCHAR(100)
    , customer_email VARCHAR(100)
    , vin DECIMAL(6,0)
    , vehicle_year INT
    , make VARCHAR(50)
    , model VARCHAR(50)
    , vehicle_type VARCHAR(50)
    , color VARCHAR(50)
    , odometer BIGINT
    , vehicle_price DECIMAL(12,2)
    , expected_ending_value DECIMAL(12,2)
    , lease_fee DECIMAL(12,2)
    , total_price DECIMAL(12,2)
    , monthly_payment DECIMAL(12,2)
    , FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

# ------------------------------------------------------------ # 
#                    Adding sample dealerships                 #
# ------------------------------------------------------------ #
INSERT INTO 
    dealerships (
        name
        , address
        , phone
    ) 
VALUES 
    (
        'D&E Motors'
        , '123 Awesome Lane'
        , '555-867-5309'
    );

INSERT INTO 
    dealerships (
        name
        , address
        , phone
    ) 
VALUES 
    (
        'Pizza Place Motors'
        , '456 Main St'
        , '555-749-9248'
    );

# ------------------------------------------------------------ #
#                    Adding sample vehicles                   #
# ------------------------------------------------------------ #

INSERT INTO 
    vehicles (
        vin
        , year
        , make
        , model
        , vehicle_type
        , color
        , odometer
        , price
    )
VALUES 
    #  VIN   YEAR    MAKE      MODEL     TYPE   COLOR  MILEAGE  PRICE #
    (837492, 2022, 'Toyota', 'Corolla', 'car', 'White', 1500, 25999.99),
    (192837, 2021, 'Honda', 'Civic', 'car', 'Gray', 12000, 22500.00),
    (564738, 2023, 'Tesla', 'Model 3', 'car', 'Silver', 50, 45999.99),
    (293847, 2020, 'Ford', 'F-150', 'truck', 'White', 35000, 32999.99),
    (102938, 2019, 'Dodge', 'Challenger', 'car', 'Black', 45000, 28500.00),
    (102939, 2020, 'Kia', 'Soul', 'car', 'Gray', 65000, 16999.99),
    (475869, 2022, 'Jeep', 'Wrangler', 'SUV', 'Gray', 5000, 38999.99),
    (475870, 2022, 'Hyundai', 'Elantra', 'car', 'Black', 18000, 24999.99),
    (293848, 2021, 'Mercedes', 'C-Class', 'car', 'Silver', 1000, 45999.99),
    (657483, 2020, 'Volkswagen', 'Golf', 'car', 'Black', 80000, 15999.99),
    (182736, 2022, 'Subaru', 'WRX', 'car', 'Blue', 15000, 32999.99),
    (394857, 2021, 'Nissan', 'Altima', 'car', 'Gray', 5000, 27999.99),
    (576849, 2023, 'Ford', 'Mustang', 'car', 'Red', 500, 48999.99),
    (283746, 2020, 'Toyota', 'Prius', 'car', 'Green', 120000, 12999.99),
    (918273, 2022, 'Honda', 'Odyssey', 'van', 'Gray', 45000, 29999.99),
    (645738, 2021, 'Chevrolet', 'Silverado', 'truck', 'White', 25000, 39999.99),
    (384920, 2023, 'Porsche', '911', 'car', 'Red', 50, 125999.99),
    (837465, 2023, 'Mazda', 'Miata', 'car', 'Red', 2500, 35999.99),
    (482736, 2008, 'Tesla', 'Roadster', 'car', 'Red', 633600000, 99999999.99);

# ------------------------------------------------------------ #
#                    Adding sample inventory                  #
# ------------------------------------------------------------ #   
INSERT INTO 
    inventory (
        dealership_id
        , VIN
    )
VALUES
    #  DEALERSHIP_ID   VIN #
            (1,      837492),
            (1,      192837),
            (1,      564738),
            (1,      293847),
            (1,      102938),
            (1,      102939),
            (1,      475869),
            (1,      475870),
            (1,      293848),
            (1,      657483),
            (1,      182736),
            (2,      394857),
            (2,      576849),
            (2,      283746),
            (2,      918273),
            (2,      645738),
            (2,      384920),
            (2,      837465),
            (2,      482736);
    
# ------------------------------------------------------------ #
#                 Adding sample sales contracts                #
# ------------------------------------------------------------ #
INSERT INTO 
    SalesContracts (
        date
        , customer_name
        , customer_email
        , vin
        , vehicle_year
        , make
        , model
        , vehicle_type
        , color
        , odometer
        , vehicle_price
        , sales_tax
        , recording_fee
        , processing_fee
        , total_price
        , is_financed
        , monthly_payment
    )
VALUES
    (
        '2021-09-28'
        , 'Dana Wyatt'
        , 'dana@texas.com'
        , 837492
        , 1993
        , 'Ford'
        , 'Explorer'
        , 'SUV'
        , 'Red'
        , 525123
        , 995.00
        , 100.00
        , 295.00
        , 49.75
        , 1439.75
        , FALSE
        , 0.00
    );

# ------------------------------------------------------------ #
#                 Adding sample lease contracts                #
# ------------------------------------------------------------ #
INSERT INTO 
    LeaseContracts (
        date
        , customer_name
        , customer_email
        , vin
        , vehicle_year
        , make
        , model
        , vehicle_type
        , color
        , odometer
        , vehicle_price
        , expected_ending_value
        , lease_fee
        , total_price
        , monthly_payment
    )
VALUES
    (
        '2021-09-28'
        , 'Zachary Westly'
        , 'zach@texas.com'
        , 482736
        , 2008
        , 'Tesla'
        , 'Roadster'
        , 'car'
        , 'Red'
        , 633600000
        , 99999999.99
        , 49999999.99
        , 6999999.99
        , 56999999.98
        , 1583333.33
    );


