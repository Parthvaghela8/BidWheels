CREATE FUNCTION dbo.GetAverageRatingOfShipper (@ShipperID INT)
RETURNS DECIMAL(5, 2)
AS
BEGIN
    DECLARE @AverageRating DECIMAL(5, 2);

    SELECT @AverageRating = AVG(CAST(Rating AS DECIMAL(5, 2)))
    FROM Feedback
    WHERE ShipperID = @ShipperID;

    RETURN ISNULL(@AverageRating, 0); -- Return 0 if no rating is found for the shipper
END;


---- Example: Get average rating for Shipper with ID 1
--SELECT dbo.GetAverageRatingOfShipper(1) AS AverageRatingForShipper1;
