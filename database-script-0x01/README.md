# Airbnb Database Schema

This schema defines the structure of an Airbnb-style booking platform using SQL (PostgreSQL-compliant). It supports user accounts, property listings, bookings, payments, messaging, and reviews.

---

## 🧱 Tables Overview

### 1. `users`
Stores all user data (guests, hosts, admins).

- `user_id`: UUID, primary key
- `email`: unique, required
- `role`: ENUM-like validation (`guest`, `host`, `admin`)

### 2. `properties`
Details of rental listings.

- Linked to `users` via `host_id`

### 3. `bookings`
Captures reservations.

- Linked to `users` (guest) and `properties`
- `total_price` is stored, not computed on the fly for performance

### 4. `payments`
Stores payment records.

- Tied to a `booking`

### 5. `reviews`
User feedback on properties.

- Each review references both a `user` and a `property`

### 6. `messages`
Private messages between users.

- Tracks sender and recipient with foreign keys to `users`

---

## 🚀 Indexes

Indexes improve performance for common queries (like finding properties by host, or bookings by user).

---

## ✅ Constraints

- Foreign keys ensure referential integrity
- CHECK constraints restrict values (e.g., `rating`, `role`)
- Timestamps auto-default to the current time
