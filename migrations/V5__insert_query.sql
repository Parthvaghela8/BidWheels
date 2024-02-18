-- Insert records into the Address table
INSERT INTO Address (StreetAddress, City, State, PostalCode, Latitude, Longitude)
VALUES 
    ('123 Main St', 'New York', 'NY', '10001', 40.7128, -74.0060),
    ('456 Elm St', 'Los Angeles', 'CA', '90001', 34.0522, -118.2437),
    ('789 Oak St', 'Chicago', 'IL', '60601', 41.8781, -87.6298);


--Insert records into Shipment Categories Table
INSERT INTO ShipmentCategories (CategoryID, CategoryName, Description)
VALUES 
    (1, 'Heavy Items', 'Large or weighty items requiring special handling during shipment'),
    (2, 'Fragile Items', 'Delicate items requiring careful handling to prevent damage'),
    (3, 'Perishable Goods', 'Items that can spoil or decay if not transported under specific conditions');


-- Insert records into the Shipments table
INSERT INTO Shipments (ShipmentID, CustomerID, Origin, Destination, ShipmentDate, DeliveryDate, MaxBidAmount, BidStartTime, BidEndTime, Status, CategoryID, OriginAddressID, DestinationAddressID)
VALUES 
    (1, 1, 'New York', 'Los Angeles', '2024-02-20', '2024-02-25', 100.00, '2024-02-20 10:00:00', '2024-02-22 10:00:00', 'Pending', 1, 1, 3),
    (2, 2, 'Chicago', 'Houston', '2024-02-21', '2024-02-26', 150.00, '2024-02-21 10:00:00', '2024-02-23 10:00:00', 'In Transit', 2, 2, 3),
    (3, 3, 'Miami', 'Seattle', '2024-02-22', '2024-02-27', 200.00, '2024-02-22 10:00:00', '2024-02-24 10:00:00', 'Delivered', 3, 3, 2);
