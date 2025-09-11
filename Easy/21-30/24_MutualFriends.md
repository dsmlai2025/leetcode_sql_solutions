# Problem 24 - Mutual Friends


---

## 📄 Problem Statement
You are analyzing a social network dataset at Google. Your task is to find mutual friends between two users, Karl and Hans. There is only one user named Karl and one named Hans in the dataset. The output should contain 'user_id' and 'user_name' columns.


**Table:** 

CREATE TABLE users(user_id INT, user_name varchar(30)); 

INSERT INTO users VALUES (1, 'Karl'), (2, 'Hans'), (3, 'Emma'), (4, 'Emma'), (5, 'Mike'), (6, 'Lucas'), (7, 'Sarah'), (8, 'Lucas'), (9, 'Anna'), (10, 'John'); 

CREATE TABLE friends(user_id INT, friend_id INT); 

INSERT INTO friends VALUES (1,3),(1,5),(2,3),(2,4),(3,1),(3,2),(3,6),(4,7),(5,8),(6,9),(7,10),(8,6),(9,10),(10,7),(10,9); 


---

### Task
FILL

---

## 🧪 Example

**Output**
FILL

  
**Explanation:**

The CTEs (karl_friends and hans_friends) efficiently find all friends for Karl and Hans, respectively. 
The main query joins these CTEs with the users table to find the users who are present in both Karl's and Hans's friend lists (mutual friends).
Finds the user_id for Karl and Hans.
Selects the friends of Karl and friends of Hans separately.
Finds the intersection of their friends (mutual friends).
Retrieves the user_id and user_name of the mutual friends.

---

## 💡 Approach

- FILL

---

## 💻 SQL Solution

```sql
WITH karl_friends AS (
  SELECT friend_id 
  FROM friends 
  WHERE user_id = (SELECT user_id FROM users WHERE user_name = 'Karl')
),
hans_friends AS (
  SELECT friend_id 
  FROM friends 
  WHERE user_id = (SELECT user_id FROM users WHERE user_name = 'Hans')
)
SELECT u.user_id, u.user_name
FROM karl_friends k
JOIN hans_friends h ON k.friend_id = h.friend_id
JOIN users u ON u.user_id = k.friend_id;
