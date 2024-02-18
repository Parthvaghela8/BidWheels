CREATE PROCEDURE InsertShipment 
    @Origin VARCHAR(255),
    @Destination VARCHAR(255),
    @ShipmentDate DATE,
    @DeliveryDate DATE,
    @MaxBidAmount DECIMAL(10, 2),
    @BidStartTime DATETIME,
    @BidEndTime DATETIME,
    @ImageData VARBINARY(MAX),
    @OriginAddressID INT,
    @DestinationAddressID INT,
    @CategoryID INT,
    @Description TEXT,
    @ShipmentStatus VARCHAR(50)
AS
BEGIN
    -- Begin a transaction
    BEGIN TRANSACTION;

    -- Insert the shipment into the Shipments table
    INSERT INTO Shipments (
        Origin, Destination, ShipmentDate, DeliveryDate, 
        MaxBidAmount, BidStartTime, BidEndTime, ImageData, 
        OriginAddressID, DestinationAddressID, CategoryID, Description, ShipmentStatus
    ) VALUES (
        @Origin, @Destination, @ShipmentDate, @DeliveryDate, 
        @MaxBidAmount, @BidStartTime, @BidEndTime, @ImageData, 
        @OriginAddressID, @DestinationAddressID, @CategoryID, @Description, @ShipmentStatus
    );

    -- Commit the transaction if successful
    COMMIT TRANSACTION;

    -- Return success message
    SELECT 'Shipment inserted successfully.' AS Result;
END;


--EXEC InsertShipment 'New York', 'Los Angeles', '2024-02-20', '2024-02-25', 100.00, '2024-02-19 09:00:00', '2024-02-20 17:00:00', 0x, 1, 2, 1, 'Description', 'Pending';
