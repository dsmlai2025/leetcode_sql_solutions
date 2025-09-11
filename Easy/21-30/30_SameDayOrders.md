# Problem 30 - Exchange Rates

## 📄 Problem Statement
Identify users who started a session and placed an order on the same day. For these users, calculate the total number of orders and the total order value for that day. 
Your output should include the user, the session date, the total number of orders, and the total order value for that day.

**Table:** 

𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭
CREATE TABLE sessions(session_id INT PRIMARY KEY,user_id INT,session_date DATETIME); 

INSERT INTO sessions(session_id, user_id, session_date) VALUES (1, 1, '2024-01-01 00:00:00'),(2, 2, '2024-01-02 00:00:00'),(3, 3, '2024-01-05 00:00:00'),(4, 3, '2024-01-05 00:00:00'),(5, 4, '2024-01-03 00:00:00'),(6, 4, '2024-01-03 00:00:00'),(7, 5, '2024-01-04 00:00:00'),(8, 5, '2024-01-04 00:00:00'),(9, 3, '2024-01-05 00:00:00'),(10, 5, '2024-01-04 00:00:00'); 

CREATE TABLE order_summary (order_id INT PRIMARY KEY,user_id INT,order_value INT,order_date DATETIME); 

INSERT INTO order_summary (order_id, user_id, order_value, order_date) VALUES (1, 1, 152, '2024-01-01 00:00:00'),(2, 2, 485, '2024-01-02 00:00:00'),(3, 3, 398, '2024-01-05 00:00:00'),(4, 3, 320, '2024-01-05 00:00:00'),(5, 4, 156, '2024-01-03 00:00:00'),(6, 4, 121, '2024-01-03 00:00:00'),(7, 5, 238, '2024-01-04 00:00:00'),(8, 5, 70, '2024-01-04 00:00:00'),(9, 3, 152, '2024-01-05 00:00:00'),(10, 5, 171, '2024-01-04 00:00:00'); 


## 🧪 Example

**Output**
FILL

---

## 💡 Approach

JOIN: We join the sessions table with the order_summary table on user_id and the condition that the session_date and order_date fall on the same calendar day. We use CONVERT(DATE, s.session_date) and CONVERT(DATE, o.order_date) to ignore the time portion, matching only the date. 
COUNT and SUM: We use COUNT(o.order_id) to count the total orders placed by each user on the session day and SUM(o.order_value) to get the total order value for that day. 
GROUP BY: This groups the results by each user and session date. 
HAVING Clause: The HAVING COUNT(o.order_id) > 0 ensures we only get records for users who placed at least one order on the session date.
---

## 💻 SQL Solution

```sql
SELECT 
    s.user_id,
    DATE(s.session_date) AS session_date,
    COUNT(o.order_id) AS total_orders,
    SUM(o.order_value) AS total_order_value
FROM sessions s
JOIN order_summary o
    ON s.user_id = o.user_id AND DATE(s.session_date) = DATE(o.order_date)
GROUP BY s.user_id, DATE(s.session_date)
HAVING COUNT(o.order_id) > 0
ORDER BY s.user_id, session_date;
