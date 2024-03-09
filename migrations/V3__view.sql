CREATE VIEW feedback_view AS
SELECT
    F.feedback_id,
    F.shipment_id,
    F.customer_id,
    F.shipper_id,
    F.rating,
    F.comment,
    S.shipper_id AS is_feedback_given
FROM
    feedback F
LEFT JOIN
    shippers S ON F.shipper_id = S.shipper_id;
