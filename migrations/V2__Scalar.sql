-- Create Scalar Function
CREATE FUNCTION dbo.GetMinBidIDForShipment
(
    @ShipmentID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @MinBidID INT;

    SELECT TOP 1 @MinBidID = BidID
    FROM Bids
    WHERE ShipmentID = @ShipmentID
    ORDER BY BidAmount ASC;

    RETURN @MinBidID;
END;


--DECLARE @ShipmentID INT = 1;
--DECLARE @MinBidID INT;

-- Call the scalar function

--SET @MinBidID = dbo.GetMinBidIDForShipment(@ShipmentID);

-- Now @MinBidID contains the BidID with the minimum bid amount for ShipmentID 1
