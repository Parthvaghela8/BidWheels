CREATE VIEW ShipmentDetails AS
SELECT
    S.ShipmentID,
    S.ShipmentDate,
    S.DeliveryDate,
    S.MaxBidAmount,
    S.BidStartTime,
    S.BidEndTime,
    S.ImageURL,
    S.CategoryID,
    S.Description,
    S.ShipmentStatus,
    A1.StreetAddress AS OriginStreet,
    A1.City AS OriginCity,
    A1.State AS OriginState,
    A1.PostalCode AS OriginPostal,
    A2.StreetAddress AS DestStreet,
    A2.City AS DestCity,
    A2.State AS DestState,
    A2.PostalCode AS DestPostal
FROM Shipments S
JOIN Address A1 ON S.OriginAddressID = A1.AddressID
JOIN Address A2 ON S.DestinationAddressID = A2.AddressID;
