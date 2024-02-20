CREATE PROCEDURE GetUserDetails
    @UserID INT
AS
BEGIN
    -- Select user details based on the provided UserID
    SELECT
        U.UserID,
        U.Email,
        UD.FirstName,
        UD.LastName,
        UD.Gender,
        UD.DOB,
        UD.ContactNumber
    FROM
        Users U
    JOIN
        UserDetails UD ON U.UserID = UD.UserID
    WHERE
        U.UserID = @UserID;
END;


---- Declare a variable to store the UserID
--DECLARE @UserID INT = 1;

---- Execute the stored procedure
--EXEC GetUserDetails @UserID;
