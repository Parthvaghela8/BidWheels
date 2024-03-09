--- GetAverageRatingOfShipper Function
CREATE FUNCTION dbo.get_average_rating_of_shipper (@shipper_id INT)
RETURNS DECIMAL(5, 2)
AS
BEGIN
    DECLARE @average_rating DECIMAL(5, 2);

    SELECT @average_rating = AVG(CAST(rating AS DECIMAL(5, 2)))
    FROM feedback
    WHERE shipper_id = @shipper_id;

    RETURN ISNULL(@average_rating, 0); -- Return 0 if no rating is found for the shipper
END;

---- Example: Get average rating for Shipper with ID 1
--SELECT dbo.GetAverageRatingOfShipper(1) AS AverageRatingForShipper1;
