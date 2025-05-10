# Airbnb Database – Normalization to 3NF

This document outlines the steps taken to normalize the Airbnb database schema to **Third Normal Form (3NF)** to eliminate redundancy and ensure data integrity.

---

## 🧠 Normalization Overview

Normalization is a step-by-step process used to organize data in a relational database to reduce redundancy and improve data integrity.

The goal is to reach **3NF**, which requires:

1. **1NF (First Normal Form)**: 
   - Atomic values (no repeating groups or arrays).
2. **2NF (Second Normal Form)**: 
   - In 1NF + No partial dependency on a composite primary key.
3. **3NF (Third Normal Form)**: 
   - In 2NF + No transitive dependencies (non-key attributes depend only on the primary key).

---

## ✅ Step-by-Step Normalization

### 1️⃣ First Normal Form (1NF)

All tables meet the following 1NF criteria:
- Each field contains only **atomic values** (no multiple values in a single field).
- Each record is **uniquely identifiable** via a primary key (UUIDs used).
- **No repeating groups** exist in any table.

✅ **Result**: All entities are in 1NF.

---

### 2️⃣ Second Normal Form (2NF)

- All tables have a **single-column primary key**, so there is **no partial dependency**.
- All non-key attributes are fully functionally dependent on the primary key.

✅ **Result**: All tables satisfy 2NF.

---

### 3️⃣ Third Normal Form (3NF)

- All non-key attributes are **directly dependent on the primary key only**.
- There are **no transitive dependencies** (i.e., no non-key field depends on another non-key field).

#### Examples:
- In the `Booking` table, `total_price` is derived from `start_date`, `end_date`, and `Property.pricepernight`, but it is **stored for performance** (denormalization for read efficiency), not because of a transitive dependency.
- In the `User` table, attributes like `email`, `phone_number`, and `role` are directly dependent on `user_id`.

✅ **Result**: All entities are in 3NF.

---

## 🧹 Notes on Redundancy and Design Choices

- `total_price` is the only calculated/stored field — included for quick lookup but not a violation of 3NF due to performance-driven denormalization.
- ENUM used for `User.role` ensures consistent values and prevents redundancy in role labeling.
- All foreign keys reference only the **primary keys of other tables** to maintain referential integrity.

---

## ✅ Final Verdict

All entities and relationships in the Airbnb schema comply with **Third Normal Form (3NF)**. The design:
- Prevents data anomalies,
- Eliminates redundancy,
- Maintains flexibility for queries and scaling.

