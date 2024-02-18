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
    ShipperContactInfo VARCHAR(255),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    CustomerContactInfo VARCHAR(255),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- ShipmentCategories Table
CREATE TABLE ShipmentCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255),
    Description TEXT
);

-- Address Table
CREATE TABLE Address (
    AddressID INT PRIMARY KEY,
    StreetAddress VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    PostalCode VARCHAR(20),
    Latitude DECIMAL(9, 6),
    Longitude DECIMAL(9, 6)
);

-- Shipments Table
CREATE TABLE Shipments (
    ShipmentID INT PRIMARY KEY,
    Origin VARCHAR(255),
    Destination VARCHAR(255),
    ShipmentDate DATE,
    DeliveryDate DATE,
    MaxBidAmount DECIMAL(10, 2),
    BidStartTime DATETIME,
    BidEndTime DATETIME,
    ImageData VARBINARY(MAX),
    OriginAddressID INT,
    DestinationAddressID INT,
    CategoryID INT,
    Description TEXT,
    ShipmentStatus VARCHAR(50) -- Added ShipmentStatus column directly
    FOREIGN KEY (CategoryID) REFERENCES ShipmentCategories(CategoryID),
    FOREIGN KEY (OriginAddressID) REFERENCES Address(AddressID),
    FOREIGN KEY (DestinationAddressID) REFERENCES Address(AddressID)
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

-- FinalShipperForShipment Table
CREATE TABLE FinalShipperForShipment (
    ShipmentID INT PRIMARY KEY,
    ShipperID INT,
    FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
);
