CREATE VIEW UserRatingsView
AS
SELECT
    u.UserID,
    u.Username,
    u.Email,
    AVG(CAST(f.Rating AS DECIMAL(5, 2))) AS AverageRating
FROM
    Users u
LEFT JOIN
    Feedback f ON u.UserID = f.UserID
GROUP BY
    u.UserID, u.Username, u.Email;


--SELECT * FROM UserRatingsView;
