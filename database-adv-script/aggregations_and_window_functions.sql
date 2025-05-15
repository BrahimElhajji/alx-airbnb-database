SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_number_rank,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_rank
FROM bookings
GROUP BY property_id;
