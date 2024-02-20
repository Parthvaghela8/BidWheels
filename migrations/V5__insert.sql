-- Insert into Users
INSERT INTO Users (Email) VALUES ('user1@example.com');
INSERT INTO Users (Email) VALUES ('user2@example.com');

-- Insert into UserDetails
INSERT INTO UserDetails (UserID, FirstName, LastName, Gender, DOB, ContactNumber)
VALUES (1, 'John', 'Doe', 'Male', '1990-01-15', 1234567890);

INSERT INTO UserDetails (UserID, FirstName, LastName, Gender, DOB, ContactNumber)
VALUES (2, 'Jane', 'Smith', 'Female', '1985-05-22', 9876543210);

-- Insert into Shippers
INSERT INTO Shippers (UserID) VALUES (1);
INSERT INTO Shippers (UserID) VALUES (2);

-- Insert into Customers
INSERT INTO Customers (UserID) VALUES (2);
INSERT INTO Customers (UserID) VALUES (1);

-- Insert into ShipmentCategories
INSERT INTO ShipmentCategories (CategoryName, Description) VALUES ('Electronics', 'Electronic gadgets and appliances');
INSERT INTO ShipmentCategories (CategoryName, Description) VALUES ('Furniture', 'Household furniture and decor');
INSERT INTO ShipmentCategories (CategoryName, Description) VALUES ('Heavy Equipment', 'Large and heavy machinery');

-- Insert into State
INSERT INTO State (StateName) VALUES ('New York');
INSERT INTO State (StateName) VALUES ('California');

-- Insert into City
INSERT INTO City (CityName, StateID) VALUES ('New York City', 1);
INSERT INTO City (CityName, StateID) VALUES ('Los Angeles', 2);

-- Insert into Address
INSERT INTO Address (StreetAddress, CityID, StateID, PostalCode) VALUES ('123 Main St', 1, 1, 10001);
INSERT INTO Address (StreetAddress, CityID, StateID, PostalCode) VALUES ('456 Oak Ave', 2, 2, 90001);

-- Insert into Shipments
INSERT INTO Shipments (ShipmentDate, DeliveryDate, MaxBidAmount, BidStartTime, BidEndTime, ImageURL, OriginAddressID, DestinationAddressID, CategoryID, Description, ShipmentStatus, CustomerID)
VALUES 
    ('2024-02-20', '2024-02-25', 100.00, '2024-02-19 09:00:00', '2024-02-20 17:00:00', 'image1.jpg', 1, 2, 1, 'Description 1', 'Pending', 1),
    ('2024-03-10', '2024-03-15', 150.00, '2024-03-09 08:00:00', '2024-03-10 16:00:00', 'image2.jpg', 2, 1, 3, 'Description 2', 'Pending', 2);

-- Insert into Bids
INSERT INTO Bids (ShipmentID, ShipperID, BidAmount, BidStatus, BidTime)
VALUES (1, 1, 120.00, 'Accepted', '2024-02-18 10:30:00');
INSERT INTO Bids (ShipmentID, ShipperID, BidAmount, BidStatus, BidTime)
VALUES (2, 2, 130.00, 'Accepted', '2024-03-08 09:45:00');

-- Insert into Feedback
INSERT INTO Feedback (ShipmentID, CustomerID, ShipperID, Rating, Comment)
VALUES (1, 1, 1, 5, 'Great service!');
INSERT INTO Feedback (ShipmentID, CustomerID, ShipperID, Rating, Comment)
VALUES (2, 2, 2, 4, 'Good experience!');

-- Insert into FinalShipperForShipment
INSERT INTO FinalShipperForShipment (BidID) VALUES (1);
INSERT INTO FinalShipperForShipment (BidID) VALUES (2);
