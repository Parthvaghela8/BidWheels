CREATE FUNCTION GetShipperAverageRating (@ShipperID INT)
RETURNS DECIMAL(5, 2)
AS
BEGIN
    DECLARE @AverageRating DECIMAL(5, 2);

    SELECT @AverageRating = AVG(Rating)
    FROM Feedback F
    INNER JOIN Shipments S ON F.ShipmentID = S.ShipmentID
    WHERE S.ShipperID = @ShipperID;

    RETURN @AverageRating;
END
GO
