-- Query 1: INNER JOIN to retrieve all bookings and respective users who made those bookings
SELECT * FROM users
INNER JOIN bookings ON users.id = bookings.user_id;

-- Query 2: LEFT JOIN to retrieve all properties and their reviews, including properties with no reviews
SELECT * FROM reviews
LEFT JOIN properties ON reviews.id = properties.review_id;

-- Query 3: FULL OUTER JOIN to retrieve all users and bookings, even if the user has no booking or a booking is not linked to a user
SELECT * FROM users
FULL OUTER JOIN bookings ON users.id = bookings.user_id;
