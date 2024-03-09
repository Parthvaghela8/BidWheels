-- Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    email VARCHAR(50) NOT NULL UNIQUE
);

-- UserDetails Table (common details for Shippers and Customers)
CREATE TABLE user_details (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    date_of_birth DATE NOT NULL,
    contact_number NUMERIC(10) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Shippers Table
CREATE TABLE shippers (
    shipper_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (user_id) REFERENCES user_details(user_id) -- Connect to UserDetails
);

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (user_id) REFERENCES user_details(user_id) -- Connect to UserDetails
);

-- ShipmentCategories Table
CREATE TABLE shipment_categories (
    category_id INT PRIMARY KEY IDENTITY(1,1),
    category_name VARCHAR(50) NOT NULL,
    description VARCHAR(255) NOT NULL
);

-- State Table
CREATE TABLE states (
    state_id INT PRIMARY KEY IDENTITY(1,1),
    state_name VARCHAR(100) NOT NULL
);

-- City Table
CREATE TABLE cities (
    city_id INT PRIMARY KEY IDENTITY(1,1),
    city_name VARCHAR(50) NOT NULL,
    state_id INT NOT NULL,
    FOREIGN KEY (state_id) REFERENCES states(state_id)
);

-- Address Table
CREATE TABLE addresses (
    address_id INT PRIMARY KEY IDENTITY(1,1),
    street_address VARCHAR(255) NOT NULL,
    city_id INT NOT NULL,
    state_id INT NOT NULL,
    postal_code NUMERIC(6, 0) NOT NULL,
    FOREIGN KEY (city_id) REFERENCES cities(city_id),
    FOREIGN KEY (state_id) REFERENCES states(state_id)
);

-- Shipments Table
CREATE TABLE shipments (
    shipment_id INT PRIMARY KEY IDENTITY(1,1),
    shipment_date DATETIME NOT NULL,
    delivery_date DATETIME NOT NULL,
    max_bid_amount MONEY NOT NULL,
    bid_start_time DATETIME NOT NULL,
    bid_end_time DATETIME NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    origin_address_id INT NOT NULL,
    destination_address_id INT NOT NULL,
    category_id INT NOT NULL,
    description VARCHAR(255) NOT NULL,
    shipment_status VARCHAR(50) NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES shipment_categories(category_id),
    FOREIGN KEY (origin_address_id) REFERENCES addresses(address_id),
    FOREIGN KEY (destination_address_id) REFERENCES addresses(address_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Bids Table
CREATE TABLE bids (
    bid_id INT PRIMARY KEY IDENTITY(1,1),
    shipment_id INT NOT NULL,
    shipper_id INT NOT NULL,
    bid_amount MONEY NOT NULL,
    bid_status VARCHAR(50) NOT NULL,
    bid_time DATETIME NOT NULL,
    FOREIGN KEY (shipment_id) REFERENCES shipments(shipment_id),
    FOREIGN KEY (shipper_id) REFERENCES shippers(shipper_id)
);

-- Feedback Table
CREATE TABLE feedback (
    feedback_id INT PRIMARY KEY IDENTITY(1,1),
    shipment_id INT NOT NULL,
    customer_id INT NOT NULL,
    shipper_id INT NOT NULL,
    rating INT NOT NULL,
    comment VARCHAR(255) NOT NULL,
    FOREIGN KEY (shipment_id) REFERENCES shipments(shipment_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (shipper_id) REFERENCES shippers(shipper_id)
);

-- FinalShipperForShipment Table
CREATE TABLE final_shipper_for_shipment (
    final_deal_id INT PRIMARY KEY IDENTITY(1,1),
    bid_id INT NOT NULL,
    FOREIGN KEY (bid_id) REFERENCES bids(bid_id)
);
