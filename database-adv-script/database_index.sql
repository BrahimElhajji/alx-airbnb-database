-- Index on users.id is optional if it's a PRIMARY KEY
SELECT * FROM bookings WHERE user_id = 5;

CREATE INDEX idx_bookings_user_id ON bookings(user_id);

CREATE INDEX idx_bookings_property_id ON bookings(property_id);

CREATE INDEX idx_reviews_property_id ON reviews(property_id);
