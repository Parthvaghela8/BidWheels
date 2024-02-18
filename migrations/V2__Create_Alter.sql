CREATE TABLE ShipmentCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255),
    Description TEXT
);

CREATE TABLE Address (
    AddressID INT PRIMARY KEY,
    StreetAddress VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    PostalCode VARCHAR(20),
    Latitude DECIMAL(9, 6),
    Longitude DECIMAL(9, 6)
);
 
-- Add CategoryID to Shipments Table
ALTER TABLE Shipments
ADD CategoryID INT;

-- Add Foreign Key Constraint
ALTER TABLE Shipments
ADD CONSTRAINT fk_shipments_category
FOREIGN KEY (CategoryID) REFERENCES ShipmentCategories(CategoryID);

ALTER TABLE Shipments
ADD ImageData VARBINARY(MAX);

-- Alter table to add foreign key constraint for OriginAddressID
ALTER TABLE Shipments
ADD OriginAddressID INT;

ALTER TABLE Shipments
ADD CONSTRAINT FK_Shipments_OriginAddress
FOREIGN KEY (OriginAddressID) REFERENCES Address(AddressID);

-- Alter table to add foreign key constraint for DestinationAddressID
ALTER TABLE Shipments
ADD DestinationAddressID INT;

ALTER TABLE Shipments
ADD CONSTRAINT FK_Shipments_DestinationAddress
FOREIGN KEY (DestinationAddressID) REFERENCES Address(AddressID);
