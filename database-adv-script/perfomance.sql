-- Initial complex query to retrieve all bookings with related user, property, and payment details
SELECT 
    bookings.id AS booking_id,
    users.name AS user_name,
    properties.name AS property_name,
    payments.amount AS payment_amount,
    payments.payment_date
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
LEFT JOIN payments ON payments.booking_id = bookings.id;
