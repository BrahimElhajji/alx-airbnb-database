-- Step 1: Drop old table if it exists
DROP TABLE IF EXISTS bookings CASCADE;

-- Step 2: Create the main partitioned bookings table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions for different years
CREATE TABLE bookings_2023 PARTITION OF bookings
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Test: Query using a specific date range
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';
