CREATE DATABASE coffee_ecommerce;
\c coffee_ecommerce

CREATE TABLE IF NOT EXISTS users(
    id BIGSERIAL PRIMARY KEY NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(100) NOT NULL,
    password_ VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS regions(
    id BIGSERIAL PRIMARY KEY NOT NULL,
    region_name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS addresses(
    id BIGSERIAL PRIMARY KEY NOT NULL,
    house_number VARCHAR(20) NOT NULL,
    street_name VARCHAR(100) NOT NULL,
    barangay VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    region_id BIGINT NOT NULL REFERENCES regions(id)
);

CREATE TABLE IF NOT EXISTS users_addresses(
    user_id_ BIGINT REFERENCES users(id),
    address_id BIGINT REFERENCES addresses(id),
    is_default BOOLEAN NOT NULL
);

-- POPULATE
INSERT INTO users (first_name, last_name, email, phone_number, password_)
VALUES
    ('John', 'Doe', 'john.doe@example.com', '123-456-7890', 'hashed_password_1'),
    ('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', 'hashed_password_2'),
    ('Alice', 'Johnson', 'alice.johnson@example.com', '555-123-4567', 'hashed_password_3'),
    ('Sarah', 'Wilson', 'sarah.wilson@example.com', '111-222-3333', 'hashed_password_4'),
    ('Michael', 'Brown', 'michael.brown@example.com', '444-555-6666', 'hashed_password_5'),
    ('Emily', 'Jones', 'emily.jones@example.com', '777-888-9999', 'hashed_password_6'),
    ('David', 'Lee', 'david.lee@example.com', '222-333-4444', 'hashed_password_7'),
    ('Olivia', 'Garcia', 'olivia.garcia@example.com', '666-777-8888', 'hashed_password_8'),
    ('William', 'Martinez', 'william.martinez@example.com', '555-666-7777', 'hashed_password_9'),
    ('Sophia', 'Hernandez', 'sophia.hernandez@example.com', '333-444-5555', 'hashed_password_10');

-- POPULATE
INSERT INTO regions (region_name) VALUES
    ('Region 1'), -- For John Doe
    ('Region 2'), -- For Jane Smith
    ('Region 3'), -- For Alice Johnson
    ('Region 4'), -- For Sarah Wilson
    ('Region 5'), -- For Michael Brown
    ('Region 6'), -- For Emily Jones
    ('Region 7'), -- For David Lee
    ('Region 8'), -- For Olivia Garcia
    ('Region 9'), -- For William Martinez
    ('Region 10'); -- For Sophia Hernandez

--  POPULATE
INSERT INTO addresses (house_number, street_name, barangay, city, postal_code, region_id)
VALUES
    ('123', 'Main St', 'Anytown', 'Anytown City', '12345', 1), -- John Doe (Region 1)
    ('456', 'Elm St', 'Another City', 'Another Cityville', '54321', 2), -- Jane Smith (Region 2)
    ('789', 'Oak St', 'Nearby Town', 'Nearby City', '67890', 3), -- Alice Johnson (Region 3)
    ('111', 'Pine St', 'Downtown', 'Downtownville', '11111', 4), -- Sarah Wilson (Region 4)
    ('222', 'Cedar St', 'Suburb', 'Suburbia', '22222', 5), -- Michael Brown (Region 5)
    ('333', 'Maple St', 'Outskirts', 'Outskirtsville', '33333', 6), -- Emily Jones (Region 6)
    ('444', 'Birch St', 'Countryside', 'Countryville', '44444', 7), -- David Lee (Region 7)
    ('555', 'Willow St', 'Hills', 'Hillside', '55555', 8), -- Olivia Garcia (Region 8)
    ('666', 'Spruce St', 'Village', 'Villageville', '66666', 9), -- William Martinez (Region 9)
    ('777', 'Redwood St', 'Island', 'Islandia', '77777', 10); -- Sophia Hernandez (Region 10)
-- THESE ARE FOR MULTIPLE ADDRESSES
INSERT INTO addresses (house_number, street_name, barangay, city, postal_code, region_id)
VALUES
    ('999', 'Oak Ave', 'New Village', 'New City', '98765', 3), -- Non-default address for Alice Johnson (Region 3)
    ('777', 'Cedar Ln', 'Suburban Area', 'Suburbia', '77777', 5), -- Non-default address for Michael Brown (Region 5)
    ('555', 'Maple Rd', 'Rural Outskirts', 'Outskirtsville', '55555', 6), -- Non-default address for Emily Jones (Region 6)
    ('333', 'Birch Dr', 'Country Living', 'Countryville', '33333', 7), -- Non-default address for David Lee (Region 7)
    ('111', 'Willow Pkwy', 'Mountain View', 'Hillside', '11111', 8); -- Non-default address for Olivia Garcia (Region 8)


-- POPULATE
INSERT INTO users_addresses (user_id_, address_id, is_default)
VALUES
    (1, 1, TRUE),  -- User: John Doe (Default Address)
    (2, 2, TRUE), -- User: Jane Smith (Non-Default Address)
    (3, 3, TRUE),  -- User: Alice Johnson (Default Address)
    (4, 4, TRUE),  -- User: Sarah Wilson (Default Address)
    (5, 5, TRUE), -- User: Michael Brown (Non-Default Address)
    (6, 6, TRUE), -- User: Emily Jones (Non-Default Address)
    (7, 7, TRUE),  -- User: David Lee (Default Address)
    (8, 8, TRUE),  -- User: Olivia Garcia (Default Address)
    (9, 9, TRUE), -- User: William Martinez (Non-Default Address)
    (10, 10, TRUE); -- User: Sophia Hernandez (Default Address);
-- THESE ARE FOR MULTIPLE ADDRESSES
INSERT INTO users_addresses (user_id_, address_id, is_default)
VALUES
    (3, 11, FALSE), -- Alice Johnson's non-default address
    (5, 12, FALSE), -- Michael Brown's non-default address
    (6, 13, FALSE), -- Emily Jones's non-default address
    (7, 14, FALSE), -- David Lee's non-default address
    (8, 15, FALSE); -- Olivia Garcia's non-default address











