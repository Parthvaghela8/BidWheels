
--Users Table:
INSERT INTO Users (UserID, Username, Email, Password)
VALUES (1, 'user1', 'user1@example.com', 'password1'),
       (2, 'user2', 'user2@example.com', 'password2'),
       (3, 'user3', 'user3@example.com', 'password3');

--shippers Table:
INSERT INTO Shippers (ShipperID, ShipperName, ShipperContactInfo)
VALUES (1, 'shipper1', 'contact1'),
       (2, 'shipper2', 'contact2'),
       (3, 'shipper3', 'contact3');

-- Customers Table:
INSERT INTO Customers (CustomerID, CustomerName, CustomerContactInfo)
VALUES (1, 'customer1', 'contact1'),
       (2, 'customer2', 'contact2'),
       (3, 'customer3', 'contact3');

--shipments Table:
INSERT INTO Shipments (ShipmentID, CustomerID, Origin, Destination, ShipmentDate, DeliveryDate, MaxBidAmount, BidStartTime, BidEndTime, Status)
VALUES (1, 1, 'New York', 'Los Angeles', '2024-02-20', '2024-02-25', 100.00, '2024-02-20 10:00:00', '2024-02-22 10:00:00', 'Pending'),
       (2, 2, 'Chicago', 'Houston', '2024-02-21', '2024-02-26', 150.00, '2024-02-21 10:00:00', '2024-02-23 10:00:00', 'In Transit'),
       (3, 3, 'Miami', 'Seattle', '2024-02-22', '2024-02-27', 200.00, '2024-02-22 10:00:00', '2024-02-24 10:00:00', 'Delivered');

--Bids Table:
INSERT INTO Bids (BidID, ShipmentID, ShipperID, BidAmount, BidStatus, BidTime)
VALUES (1, 1, 1, 90.00, 'Accepted', '2024-02-21 08:00:00'),
       (2, 2, 2, 140.00, 'Pending', '2024-02-22 08:00:00'),
       (3, 3, 3, 190.00, 'Rejected', '2024-02-23 08:00:00');

--Feedback Table:
INSERT INTO Feedback (FeedbackID, ShipmentID, UserID, Rating, Comment)
VALUES (1, 1, 1, 5, 'Excellent service!'),
       (2, 2, 2, 4, 'Good experience.'),
       (3, 3, 3, 3, 'Could be better.');

--Notifications Table:
INSERT INTO Notifications (NotificationID, UserID, NotificationType, NotificationMessage, Timestamp)
VALUES (1, 1, 'Alert', 'Shipment delayed', '2024-02-25 09:00:00'),
       (2, 2, 'Reminder', 'Bid deadline approaching', '2024-02-23 12:00:00'),
       (3, 3, 'Information', 'Shipment delivered', '2024-02-27 14:00:00');


