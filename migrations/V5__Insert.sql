-- Insert data into Users table
INSERT INTO Users (Username, Email) VALUES
('JohnDoe', 'john.doe@example.com'),
('JaneSmith', 'jane.smith@example.com');

-- Insert data into Shippers table
INSERT INTO Shippers (ShipperContactNumber, UserID) VALUES
(1234567890, 1),
(9876543210, 2);

-- Insert data into Customers table
INSERT INTO Customers (CustomerContactNumber, UserID) VALUES
(5551234567, 2),
(9998765432, 1);

-- Insert data into ShipmentCategories table
INSERT INTO ShipmentCategories (CategoryName, Description) VALUES
('Electronics', 'Electronic devices and components'),
('Furniture', 'Various types of furniture');

-- Insert data into State table
INSERT INTO State (StateName) VALUES
('California'),
('New York');

-- Insert data into City table
INSERT INTO City (CityName, StateID) VALUES
('Los Angeles', 1),
('New York City', 2);

-- Insert data into Address table
INSERT INTO Address (StreetAddress, CityID, StateID, PostalCode) VALUES
('123 Main St', 1, 1, 90001),
('456 Broadway', 2, 2, 10001);

-- Insert data into Shipments table
INSERT INTO Shipments (ShipmentDate, DeliveryDate, MaxBidAmount, BidStartTime, BidEndTime, ImageURL, OriginAddressID, DestinationAddressID, CategoryID, Description, ShipmentStatus, CustomerID) VALUES
('2024-03-01', '2024-03-10', 500.00, '2024-02-20', '2024-02-25', 'image1.jpg', 1, 2, 1, 'Smartphones', 'Open', 1),
('2024-03-05', '2024-03-15', 800.00, '2024-02-25', '2024-03-01', 'image2.jpg', 2, 1, 2, 'Sofa Set', 'Open', 2);

-- Insert data into Bids table
INSERT INTO Bids (ShipmentID, ShipperID, BidAmount, BidStatus, BidTime) VALUES
(1, 1, 550.00, 'Pending', '2024-02-21'),
(2, 2, 850.00, 'Pending', '2024-02-26');

-- Insert data into Feedback table
INSERT INTO Feedback (ShipmentID, CustomerID, ShipperID, Rating, Comment) VALUES
(1, 2, 1, 4, 'Great service!'),
(2, 1, 2, 5, 'Excellent communication and timely delivery');

-- Insert data into FinalShipperForShipment table
INSERT INTO FinalShipperForShipment (BidID) VALUES
(1),
(2);
