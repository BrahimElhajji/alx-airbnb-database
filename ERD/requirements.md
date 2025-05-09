# Airbnb Database – Entity-Relationship (ER) Requirements

This document defines the **entities**, their **attributes**, and the **relationships** in the Airbnb-like platform database design.

---

## 📦 Entities and Their Attributes

### 1. 🧑‍💼 User  
Represents anyone using the platform — guest, host, or admin.

| Attribute       | Type         | Description                         |
|----------------|--------------|-------------------------------------|
| user_id        | UUID (PK)    | Unique identifier for the user      |
| first_name     | VARCHAR      | User's first name                   |
| last_name      | VARCHAR      | User's last name                    |
| email          | VARCHAR      | Must be unique                      |
| password_hash  | VARCHAR      | Hashed password                     |
| phone_number   | VARCHAR      | Optional                            |
| role           | ENUM         | 'guest', 'host', or 'admin'         |
| created_at     | TIMESTAMP    | Date of account creation            |

---

### 2. 🏠 Property  
Each listing available for booking, owned by a host.

| Attribute       | Type         | Description                          |
|----------------|--------------|--------------------------------------|
| property_id    | UUID (PK)    | Unique ID for the property           |
| host_id        | UUID (FK)    | References User(user_id)             |
| name           | VARCHAR      | Property name                        |
| description    | TEXT         | Description of the property          |
| location       | VARCHAR      | City or address                      |
| pricepernight  | DECIMAL      | Cost per night                       |
| created_at     | TIMESTAMP    | Listing creation date                |
| updated_at     | TIMESTAMP    | Last update                          |

---

### 3. 📅 Booking  
Represents a reservation made by a guest.

| Attribute       | Type         | Description                                       |
|----------------|--------------|---------------------------------------------------|
| booking_id     | UUID (PK)    | Unique booking ID                                |
| user_id        | UUID (FK)    | References User(user_id) (guest)                 |
| property_id    | UUID (FK)    | References Property(property_id)                 |
| start_date     | DATE         | Check-in date                                    |
| end_date       | DATE         | Check-out date                                   |
| total_price    | DECIMAL      | Auto-calculated (nights * price per night)       |
| created_at     | TIMESTAMP    | When booking was made                            |

---

### 4. 💳 Payment  
Records payment for a booking.

| Attribute       | Type         | Description                          |
|----------------|--------------|--------------------------------------|
| payment_id     | UUID (PK)    | Unique payment ID                    |
| booking_id     | UUID (FK)    | References Booking(booking_id)       |
| amount         | DECIMAL      | Amount paid                          |
| payment_method | VARCHAR      | e.g., credit card, PayPal            |
| payment_date   | TIMESTAMP    | When payment occurred                |

---

### 5. 🌟 Review  
User reviews a property.

| Attribute       | Type         | Description                          |
|----------------|--------------|--------------------------------------|
| review_id      | UUID (PK)    | Unique review ID                     |
| user_id        | UUID (FK)    | Reviewer (User.user_id)              |
| property_id    | UUID (FK)    | Reviewed property                    |
| rating         | INTEGER      | From 1 to 5                          |
| comment        | TEXT         | Optional text                        |
| created_at     | TIMESTAMP    | Date of review                       |

---

### 6. 💬 Message  
Messages between users (e.g., guest ↔ host).

| Attribute       | Type         | Description                          |
|----------------|--------------|--------------------------------------|
| message_id     | UUID (PK)    | Unique message ID                    |
| sender_id      | UUID (FK)    | User sending the message             |
| recipient_id   | UUID (FK)    | User receiving the message           |
| content        | TEXT         | Message body                         |
| sent_at        | TIMESTAMP    | When it was sent                     |

---

## 🔗 Relationships Between Entities

| Relationship                        | Type                | Explanation                                          |
|------------------------------------|---------------------|------------------------------------------------------|
| User → Property                    | One-to-Many         | A host (user) can own multiple properties            |
| User → Booking                    | One-to-Many         | A guest (user) can make multiple bookings            |
| Property → Booking                | One-to-Many         | A property can be booked many times                  |
| Booking → Payment                 | One-to-One          | Each booking has one payment                         |
| User → Review                     | One-to-Many         | A user can write many reviews                        |
| Property → Review                 | One-to-Many         | A property can receive many reviews                  |
| User → Message (sender/recipient)| Many-to-Many        | Users can message each other                         |
| User → User (via Message)         | Many-to-Many        | One user can send many messages to others            |

---

## 🖼️ 3. ER Diagram
![ChatGPT Image 10 mai 2025, 00_32_52](https://github.com/user-attachments/assets/dc6f4218-e6be-4181-88d0-31f5974c8ff8)

## 💡 Notes
- All IDs are `UUID` for unique identification.
- Important columns are indexed for performance.
- Foreign Keys enforce data consistency between tables.
