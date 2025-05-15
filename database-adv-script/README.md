# SQL Joins Project

## Overview

This project focuses on mastering SQL joins, specifically the **INNER JOIN**, **LEFT JOIN**, and **FULL OUTER JOIN**. The objective is to write complex SQL queries that retrieve data from multiple tables using different types of joins. These types of joins help to combine data from related tables and handle cases where some data might be missing in certain tables.

## Objectives

- Write a query using an **INNER JOIN** to retrieve all bookings and the respective users who made those bookings.
- Write a query using a **LEFT JOIN** to retrieve all properties and their reviews, including properties that have no reviews.
- Write a query using a **FULL OUTER JOIN** to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

## Instructions

### 1. **INNER JOIN Query**

```sql
SELECT * FROM users
INNER JOIN bookings ON users.id = bookings.user_id;
```
## Description:

This query retrieves all users and the respective bookings they have made. It uses an INNER JOIN, meaning only users who have bookings will be included in the results. If a user has no booking, they will not appear in the output.

### 2. **LEFT JOIN Query**

```sql
SELECT * FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;
```
## Description:

This query retrieves all properties and their respective reviews. It uses a LEFT JOIN, meaning that it will include all properties, even those without any reviews. For properties with no reviews, the review columns will show as NULL.

### 3. **FULL OUTER JOIN Query**

```sql
SELECT * FROM users
FULL OUTER JOIN bookings ON users.id = bookings.user_id;
```
## Description:

This query retrieves all users and all bookings. It uses a FULL OUTER JOIN, meaning it will return all users, even if they have no bookings, and all bookings, even if they are not linked to any user. For unmatched rows, the respective columns from the other table will show NULL.



# SQL Subqueries Project

## Overview

This project focuses on mastering SQL subqueries, both **correlated** and **non-correlated**. The goal is to write queries that utilize subqueries to retrieve specific data from related tables.

## Objectives

- Write a **non-correlated subquery** to find all properties where the average rating is greater than 4.0.
- Write a **correlated subquery** to find users who have made more than 3 bookings.

## Instructions

### 1. **Non-Correlated Subquery:**

```sql
SELECT * 
FROM properties
WHERE id IN (
    SELECT property_id 
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);
```
## Description:

This query retrieves all properties whose average rating is greater than 4.0. The subquery calculates the average rating for each property, and the outer query retrieves properties that have an average rating greater than 4.0.

### 2. Correlated Subquery:
```sql
SELECT id, name
FROM users u
WHERE (
    SELECT COUNT(*) 
    FROM bookings b 
    WHERE b.user_id = u.id
) > 3;
```

## Description:

This query finds all users who have made more than 3 bookings. The subquery is correlated with the outer query, as it counts the number of bookings for each user (b.user_id = u.id) in the bookings table.
