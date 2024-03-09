CREATE PROCEDURE get_user_details
    @user_id INT
AS
BEGIN
    -- Select user details based on the provided UserID
    SELECT
        U.user_id,
        U.email,
        UD.first_name,
        UD.last_name,
        UD.gender,
        UD.date_of_birth,
        UD.contact_number
    FROM
        users U
    JOIN
        user_details UD ON U.user_id = UD.user_id
    WHERE
        U.user_id = @user_id;
END;


---- Execute the stored procedure
--EXEC GetUserDetails @UserID;
