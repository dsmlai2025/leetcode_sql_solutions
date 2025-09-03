# Problem 08 - Team Power Users

---

## 📄 Problem Statement
Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022. 
Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending order based on the count of the messages.

**Table:** 

| message_id | sender_id | receiver_id | content | sent_date | 
|-----| -----| -----| -----| -----| 
| 901 | 3601 | 4500 | You up? | 08/03/2022 00:00:00 | 
| 902 | 4500 | 3601 | Only if you're buying | 08/03/2022 00:00:00 | 
| 743 | 3601 | 8752 | Let's take this offline | 06/14/2022 00:00:00 | 
| 922 | 3601 | 4500 | Get on the call | 08/10/2022 00:00:00 | 


---

### Task
To find the total number of messages of Top 2 power users

---

## 🧪 Example

**Output**
| sender_id	| message_count |
| 	3601 | 2 |
| 	4500 |	1 |


  
**Explanation:**



---

## 💡 Approach

- FILL

---

## 💻 SQL Solution

```sql
SELECT 
  sender_id,
  COUNT(message_id) AS count_messages
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) = '8'
  AND EXTRACT(YEAR FROM sent_date) = '2022'
GROUP BY sender_id
ORDER BY count_messages DESC
