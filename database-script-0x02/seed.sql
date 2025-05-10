-- Enable pgcrypto for UUID generation
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Insert users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
  (gen_random_uuid(), 'Diana', 'Evans', 'diana@guest.com', 'hashed_pw4', '111-222-3333', 'guest', NOW()),
  (gen_random_uuid(), 'Ethan', 'Baker', 'ethan@host.com', 'hashed_pw5', '444-555-6666', 'host', NOW()),
  (gen_random_uuid(), 'Fiona', 'Clark', 'fiona@admin.com', 'hashed_pw6', '777-888-9999', 'admin', NOW());

-- Insert properties (owned by host Ethan)
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
SELECT
  gen_random_uuid(),
  u.user_id,
  'Seaside Villa',
  'A luxurious villa near the beach.',
  'Santa Monica',
  300.00,
  NOW(),
  NOW()
FROM users u WHERE u.email = 'ethan@host.com';

-- Insert booking (guest Diana books Seaside Villa)
INSERT INTO bookings (booking_id, user_id, property_id, start_date, end_date, total_price, created_at)
SELECT
  gen_random_uuid(),
  guest.user_id,
  p.property_id,
  '2025-07-10',
  '2025-07-15',
  5 * p.pricepernight,
  NOW()
FROM users guest
JOIN properties p ON p.name = 'Seaside Villa'
WHERE guest.email = 'diana@guest.com';

-- Insert payment for the booking
INSERT INTO payments (payment_id, booking_id, amount, payment_method, payment_date)
SELECT
  gen_random_uuid(),
  b.booking_id,
  b.total_price,
  'paypal',
  NOW()
FROM bookings b
JOIN users u ON u.email = 'diana@guest.com';

-- Insert review (Diana reviews the property)
INSERT INTO reviews (review_id, user_id, property_id, rating, comment, created_at)
SELECT
  gen_random_uuid(),
  u.user_id,
  p.property_id,
  4,
  'Great view and clean place, would return!',
  NOW()
FROM users u
JOIN properties p ON p.name = 'Seaside Villa'
WHERE u.email = 'diana@guest.com';

-- Insert a message (Diana messages Ethan)
INSERT INTO messages (message_id, sender_id, recipient_id, content, sent_at)
SELECT
  gen_random_uuid(),
  guest.user_id,
  host.user_id,
  'Hi Ethan, is the pool heated?',
  NOW()
FROM users guest, users host
WHERE guest.email = 'diana@guest.com' AND host.email = 'ethan@host.com';
