-- Insert data into Users table
INSERT INTO Users (UserID, Username, Email, Password)
VALUES 
    (1, 'user1', 'user1@example.com', 'password1'),
    (2, 'user2', 'user2@example.com', 'password2'),
    (3, 'user3', 'user3@example.com', 'password3');

-- Insert data into Shippers table
INSERT INTO Shippers (ShipperID, ShipperName, ShipperContactInfo, UserID)
VALUES 
    (1, 'Shipper1', 'Contact info 1', 1),
    (2, 'Shipper2', 'Contact info 2', 2);

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, CustomerName, CustomerContactInfo, UserID)
VALUES 
    (1, 'Customer1', 'Contact info 1', 3);

-- Insert data into ShipmentCategories table
INSERT INTO ShipmentCategories (CategoryID, CategoryName, Description)
VALUES 
    (1, 'Category1', 'Description for category 1'),
    (2, 'Category2', 'Description for category 2');

-- Insert data into Address table
INSERT INTO Address (AddressID, StreetAddress, City, State, PostalCode, Latitude, Longitude)
VALUES 
    (1, '123 Main St', 'City1', 'State1', '12345', 40.7128, -74.0060),
    (2, '456 Elm St', 'City2', 'State2', '23456', 34.0522, -118.2437);

-- Insert data into Shipments table with new city names as origin and destination
INSERT INTO Shipments (
    ShipmentID, Origin, Destination, ShipmentDate, DeliveryDate, MaxBidAmount, 
    BidStartTime, BidEndTime, ImageData, OriginAddressID, DestinationAddressID, 
    CategoryID, Description, ShipmentStatus
)
VALUES 
    (1, 'Tokyo', 'Sydney', '2024-01-01', '2024-01-05', 100.00, 
     '2024-01-01 08:00:00', '2024-01-05 17:00:00', NULL, 1, 2, 1, 'Description for shipment 1', 'Pending'),
    (2, 'London', 'Paris', '2024-02-01', '2024-02-05', 150.00, 
     '2024-02-01 08:00:00', '2024-02-05 17:00:00', NULL, 2, 1, 2, 'Description for shipment 2', 'In Transit');


-- Insert data into Bids table
INSERT INTO Bids (BidID, ShipmentID, ShipperID, BidAmount, BidStatus, BidTime)
VALUES 
    (1, 1, 1, 90.00, 'Accepted', '2024-01-02 10:00:00'),
    (2, 1, 2, 95.00, 'Accepted', '2024-01-02 11:00:00'),
    (3, 2, 1, 140.00, 'Pending', '2024-02-02 10:00:00');

-- Insert data into Feedback table
INSERT INTO Feedback (FeedbackID, ShipmentID, UserID, Rating, Comment)
VALUES 
    (1, 1, 1, 4, 'Great service!'),
    (2, 1, 2, 5, 'Very satisfied'),
    (3, 2, 1, 3, 'Could be better');

-- Insert data into Notifications table without specifying the Timestamp column
INSERT INTO Notifications (NotificationID, UserID, NotificationType, NotificationMessage)
VALUES 
    (1, 1, 'Info', 'Notification message 1'),
    (2, 2, 'Warning', 'Notification message 2');


-- Insert data into FinalShipperForShipment table
INSERT INTO FinalShipperForShipment (ShipmentID, ShipperID)
VALUES 
    (1, 1),
    (2, 2);
