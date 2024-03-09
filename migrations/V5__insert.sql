-- Insert into users
INSERT INTO users (email) VALUES ('user1@example.com');
INSERT INTO users (email) VALUES ('user2@example.com');

-- Insert into user_details
INSERT INTO user_details (user_id, first_name, last_name, gender, date_of_birth, contact_number)
VALUES (1, 'John', 'Doe', 'Male', '1990-01-15', 1234567890);

INSERT INTO user_details (user_id, first_name, last_name, gender, date_of_birth, contact_number)
VALUES (2, 'Jane', 'Smith', 'Female', '1985-05-22', 9876543210);

-- Insert into shippers
INSERT INTO shippers (user_id) VALUES (1);
INSERT INTO shippers (user_id) VALUES (2);

-- Insert into customers
INSERT INTO customers (user_id) VALUES (2);
INSERT INTO customers (user_id) VALUES (1);

-- Insert into shipment_categories
INSERT INTO shipment_categories (category_name, description) VALUES ('Electronics', 'Electronic gadgets and appliances');
INSERT INTO shipment_categories (category_name, description) VALUES ('Furniture', 'Household furniture and decor');
INSERT INTO shipment_categories (category_name, description) VALUES ('Heavy Equipment', 'Large and heavy machinery');

-- Insert into states
INSERT INTO states (state_name) VALUES ('New York');
INSERT INTO states (state_name) VALUES ('California');

-- Insert into cities
INSERT INTO cities (city_name, state_id) VALUES ('New York City', 1);
INSERT INTO cities (city_name, state_id) VALUES ('Los Angeles', 2);

-- Insert into addresses
INSERT INTO addresses (street_address, city_id, state_id, postal_code) VALUES ('123 Main St', 1, 1, 10001);
INSERT INTO addresses (street_address, city_id, state_id, postal_code) VALUES ('456 Oak Ave', 2, 2, 90001);

-- Insert into shipments
INSERT INTO shipments (shipment_date, delivery_date, max_bid_amount, bid_start_time, bid_end_time, image_url, origin_address_id, destination_address_id, category_id, description, shipment_status, customer_id)
VALUES 
    ('2024-02-20', '2024-02-25', 100.00, '2024-02-19 09:00:00', '2024-02-20 17:00:00', 'image1.jpg', 1, 2, 1, 'Description 1', 'Pending', 1),
    ('2024-03-10', '2024-03-15', 150.00, '2024-03-09 08:00:00', '2024-03-10 16:00:00', 'image2.jpg', 2, 1, 3, 'Description 2', 'Pending', 2);

-- Insert into bids
INSERT INTO bids (shipment_id, shipper_id, bid_amount, bid_status, bid_time)
VALUES (1, 1, 120.00, 'Accepted', '2024-02-18 10:30:00');
INSERT INTO bids (shipment_id, shipper_id, bid_amount, bid_status, bid_time)
VALUES (2, 2, 130.00, 'Accepted', '2024-03-08 09:45:00');

-- Insert into feedback
INSERT INTO feedback (shipment_id, customer_id, shipper_id, rating, comment)
VALUES (1, 1, 1, 5, 'Great service!');
INSERT INTO feedback (shipment_id, customer_id, shipper_id, rating, comment)
VALUES (2, 2, 2, 4, 'Good experience!');

-- Insert into final_shipper_for_shipment
INSERT INTO final_shipper_for_shipment (bid_id) VALUES (1);
INSERT INTO final_shipper_for_shipment (bid_id) VALUES (2);
