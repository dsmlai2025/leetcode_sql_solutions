# Problem 12 - Cards Issued Difference


---

## 📄 Problem Statement
Your team at JPMorgan Chase is preparing to launch a new credit card, and to gain some insights, you're analyzing how many credit cards were issued each month.

**Table:** 

| card_name		| issued_amount	| issue_month	| issue_year| 
| ----| ---| ---| ---| 
| Chase Freedom Flex	| 	55000		| 	1	| 	2021| 
| Chase Freedom Flex	| 	60000		| 	2	| 	2021| 
| Chase Freedom Flex	| 	65000		| 	3	| 	2021| 
| Chase Freedom Flex	| 	70000		| 	4	| 	2021| 
| Chase Sapphire Reserve | 	170000	| 	1	| 	2021| 
| Chase Sapphire Reserve |	175000	| 	2	| 	2021| 
| Chase Sapphire Reserve | 180000		| 3	| 	2021| 


---

### Task
Write a query that outputs the name of each credit card and the difference in the number of issued cards between the month with the highest issuance cards and the lowest issuance.

---

## 🧪 Example

**Output**
FILL

  
**Explanation:**


---

## 💡 Approach

- GROUP BY

---

## 💻 SQL Solution

```sql
SELECT 
  card_name, 
  MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC
