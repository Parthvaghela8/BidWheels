-- Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE -- Change size to VARCHAR(50)
);
 
-- Shippers Table
CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY IDENTITY(1,1),
    ShipperContactNumber NUMERIC(10) NOT NULL,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
 
-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerContactNumber NUMERIC(10) NOT NULL,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
 
-- ShipmentCategories Table
CREATE TABLE ShipmentCategories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(50) NOT NULL,
    Description VARCHAR(255) NOT NULL
);
 
-- Address Table
CREATE TABLE Address (
    AddressID INT PRIMARY KEY IDENTITY(1,1),
    StreetAddress VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    PostalCode NUMERIC(6, 0) NOT NULL
);
 
-- Shipments Table
CREATE TABLE Shipments (
    ShipmentID INT PRIMARY KEY IDENTITY(1,1),
    ShipmentDate DATETIME NOT NULL,
    DeliveryDate DATETIME NOT NULL,
    MaxBidAmount MONEY NOT NULL,
    BidStartTime DATETIME NOT NULL,
    BidEndTime DATETIME NOT NULL,
    ImageURL VARCHAR(255) NOT NULL,
    OriginAddressID INT NOT NULL,
    DestinationAddressID INT NOT NULL,
    CategoryID INT NOT NULL,
    Description VARCHAR(255) NOT NULL,
    ShipmentStatus VARCHAR(50) NOT NULL,
    CustomerID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES ShipmentCategories(CategoryID),
    FOREIGN KEY (OriginAddressID) REFERENCES Address(AddressID),
    FOREIGN KEY (DestinationAddressID) REFERENCES Address(AddressID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
 
-- Bids Table
CREATE TABLE Bids (
    BidID INT PRIMARY KEY IDENTITY(1,1),
    ShipmentID INT NOT NULL,
    ShipperID INT NOT NULL,
    BidAmount MONEY NOT NULL,
    BidStatus VARCHAR(50) NOT NULL,
    BidTime DATETIME NOT NULL,
    FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
);
 
-- Feedback Table
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY IDENTITY(1,1),
    ShipmentID INT NOT NULL,
    CustomerID INT NOT NULL,
    ShipperID INT NOT NULL,
    Rating INT NOT NULL,
    Comment VARCHAR(255) NOT NULL,
    FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID), -- Added foreign key
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
);
 
-- FinalShipperForShipment Table
CREATE TABLE FinalShipperForShipment (
    FinalDealID INT PRIMARY KEY IDENTITY(1,1),
    BidID INT NOT NULL,
    FOREIGN KEY (BidID) REFERENCES Bids(BidID)
);
