-- Create View
CREATE VIEW CustomerShipments AS
SELECT
    C.CustomerID,
    C.CustomerContactNumber,
    S.ShipmentID,
    S.ShipmentDate,
    S.ImageURL
    S.DeliveryDate,
    S.Description AS ShipmentDescription,
FROM
    Customers C
JOIN
    Shipments S ON C.CustomerID = S.CustomerID;
