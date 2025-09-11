# Problem 14 - Estimate Cards 1st month of Launch


---

## 📄 Problem Statement
Your team at JPMorgan Chase is soon launching a new credit card. You are asked to estimate how many cards you'll issue in the first month.
Before you can answer this question, you want to first get some perspective on how well new credit card launches typically do in their first month.

**Table:** card_launch

| issue_month	|issue_year	|card_name	|		issued_amount|
|---|---|---|---|
|	1	|2021		|Chase Sapphire Reserve	|170000|
|	2	|2021		|Chase Sapphire Reserve	|175000|
|	3	|2021		|Chase Sapphire Reserve	|180000|
|	3	|2021		|Chase Freedom Flex		|65000|
|	4	|2021		|Chase Freedom Flex	|	70000|

---

### Task
Write a query that outputs the name of the credit card, and how many cards were issued in its launch month. 
The launch month is the earliest record in the monthly_cards_issued table for a given card. 
Order the results starting from the biggest issued amount.


---

## 🧪 Example

**Output**
FILL

  
**Explanation:**

FILL



---

## 💡 Approach

- FILL

---

## 💻 SQL Solution

```sql
WITH card_launch AS (
  SELECT 
    card_name, issued_amount,
    DATE(CONCAT(issue_year, '-', issue_month, '-01')) AS issue_date,
    MIN(DATE(CONCAT(issue_year, '-', issue_month, '-01'))) OVER (PARTITION BY card_name) AS launch_date
  FROM monthly_cards_issued
)
SELECT 
  card_name, issued_amount
FROM card_launch
WHERE issue_date = launch_date
ORDER BY issued_amount DESC;
