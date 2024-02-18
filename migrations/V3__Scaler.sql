CREATE FUNCTION dbo.GetAverageRatingOfUser (@UserID INT)
RETURNS DECIMAL(5, 2)
AS
BEGIN
    DECLARE @AverageRating DECIMAL(5, 2);

    SELECT @AverageRating = AVG(CAST(Rating AS DECIMAL(5, 2)))
    FROM Feedback
    WHERE UserID = @UserID;

    RETURN ISNULL(@AverageRating, 0); -- Return 0 if no rating is found for the user
END;


--SELECT dbo.GetAverageRatingOfUser(1) AS AverageRatingForShipper1;
