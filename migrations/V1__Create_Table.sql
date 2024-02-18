-- Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255)
);
 
-- Shippers Table
CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY,
    ShipperName VARCHAR(255),
    ShipperContactInfo VARCHAR(255)
);
 
-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    CustomerContactInfo VARCHAR(255)
);
 
-- Shipments Table
CREATE TABLE Shipments (
    ShipmentID INT PRIMARY KEY,
    CustomerID INT,
    Origin VARCHAR(255),
    Destination VARCHAR(255),
    ShipmentDate DATE,
    DeliveryDate DATE,
    MaxBidAmount DECIMAL(10, 2),
    BidStartTime DATETIME,
    BidEndTime DATETIME,
    Status VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
 
-- Bids Table
CREATE TABLE Bids (
    BidID INT PRIMARY KEY,
    ShipmentID INT,
    ShipperID INT,
    BidAmount DECIMAL(10, 2),
    BidStatus VARCHAR(50),
    BidTime DATETIME,
    FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
);
 
-- Feedback Table
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    ShipmentID INT,
    UserID INT,
    Rating INT,
    Comment TEXT,
    FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
 
-- Notifications Table
CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY,
    UserID INT,
    NotificationType VARCHAR(50),
    NotificationMessage TEXT,
    Timestamp TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);