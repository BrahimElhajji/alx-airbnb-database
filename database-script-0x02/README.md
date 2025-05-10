# 📦 Seed Script - Airbnb Clone Database

This directory contains the SQL script to populate the Airbnb-style database with realistic sample data. The goal is to simulate real-world usage scenarios for testing and development.

---

## 🗂️ Files

- `seed.sql` — Populates the database with sample records for all tables: `users`, `properties`, `bookings`, `payments`, `reviews`, and `messages`.

---

## 🧪 Sample Data Included

### 👤 Users
Three users with roles:
- `guest` (Diana)
- `host` (Ethan)
- `admin` (Fiona)

### 🏡 Properties
- One property: **Seaside Villa**, owned by host Ethan.

### 📅 Bookings
- Guest Diana books the Seaside Villa for 5 nights.

### 💳 Payments
- One payment using PayPal linked to the booking.

### 🌟 Reviews
- Guest Diana leaves a 4-star review for the property.

### 💬 Messages
- Diana sends a message to host Ethan asking about the pool.

---

## 🚀 Usage

Before running the seed script, ensure:
1. The database schema is already created (`schema.sql` from `database-script-0x01`).
2. The `pgcrypto` extension is enabled in your PostgreSQL instance:
   ```sql
   CREATE EXTENSION IF NOT EXISTS "pgcrypto";
   
Then execute the script:

  psql -U your_username -d your_database -f seed.sql
  

📌 Notes

UUIDs are automatically generated using gen_random_uuid().

Timestamps use NOW() to reflect the current system time.

Sample data assumes table names follow lowercase plural naming conventions (e.g., users, bookings).


