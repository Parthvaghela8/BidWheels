-- Create Stored Procedure
CREATE PROCEDURE GetOpenShipmentsForBidding
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CurrentDate DATETIME;
    SET @CurrentDate = GETDATE();

    -- Retrieve open shipments for bidding
    SELECT
        ShipmentID,
        ShipmentDate,
        MaxBidAmount,
        BidEndTime
    FROM
        Shipments
    WHERE
        @CurrentDate BETWEEN BidStartTime AND BidEndTime;
END;


-- Execute the Stored Procedure
--EXEC GetOpenShipmentsForBidding;
