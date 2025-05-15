# Partitioning Performance Report

## Why Partitioning?

The `bookings` table contains a large number of rows. Queries using `start_date` for filtering were slow.

## What Was Done

We partitioned the `bookings` table by `start_date` using range partitioning by year (2023, 2024, 2025). Each year has its own child table.

## Performance Test

We tested a query with:

```sql
SELECT * FROM bookings WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';
```
