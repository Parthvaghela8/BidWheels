CREATE VIEW FeedbackView AS
SELECT
    F.FeedbackID,
    F.ShipmentID,
    F.CustomerID,
    F.ShipperID,
    F.Rating,
    F.Comment,
    S.ShipperID AS IsFeedbackGiven
FROM
    Feedback F
LEFT JOIN
    Shippers S ON F.ShipperID = S.ShipperID;
