-- Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Email VARCHAR(50) NOT NULL UNIQUE
);

-- UserDetails Table (common details for Shippers and Customers)
CREATE TABLE UserDetails (
    UserID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    DOB DATE NOT NULL,
    ContactNumber NUMERIC(10) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Shippers Table
CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (UserID) REFERENCES UserDetails(UserID) -- Connect to UserDetails
);

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (UserID) REFERENCES UserDetails(UserID) -- Connect to UserDetails
);

-- ShipmentCategories Table
CREATE TABLE ShipmentCategories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(50) NOT NULL,
    Description VARCHAR(255) NOT NULL
);

-- State Table
CREATE TABLE State (
    StateID INT PRIMARY KEY IDENTITY(1,1),
    StateName VARCHAR(100) NOT NULL
);

-- City Table
CREATE TABLE City (
    CityID INT PRIMARY KEY IDENTITY(1,1),
    CityName VARCHAR(50) NOT NULL,
    StateID INT NOT NULL,
    FOREIGN KEY (StateID) REFERENCES State(StateID)
);

-- Address Table
CREATE TABLE Address (
    AddressID INT PRIMARY KEY IDENTITY(1,1),
    StreetAddress VARCHAR(255) NOT NULL,
    CityID INT NOT NULL,
    StateID INT NOT NULL,
    PostalCode NUMERIC(6, 0) NOT NULL,
    FOREIGN KEY (CityID) REFERENCES City(CityID),
    FOREIGN KEY (StateID) REFERENCES State(StateID)
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
    FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
);

-- FinalShipperForShipment Table
CREATE TABLE FinalShipperForShipment (
    FinalDealID INT PRIMARY KEY IDENTITY(1,1),
    BidID INT NOT NULL,
    FOREIGN KEY (BidID) REFERENCES Bids(BidID)
);
