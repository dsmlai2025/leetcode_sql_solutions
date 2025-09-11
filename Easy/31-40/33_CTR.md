# Problem 33 - CTR

## 📄 Problem Statement
Assume you have an events table on Facebook app analytics. Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.
Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
To avoid integer division, multiply the CTR by 100.0, not 100.

**Table:** 

𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭
app_id		event_type	timestamp
	123	impression	07/18/2022 11:36:12
	123	impression	07/18/2022 11:37:12
	123	click		07/18/2022 11:37:42
	234	impression	07/18/2022 14:15:12
	234	click		07/18/2022 14:16:12


## 🧪 Example

**Output**
	app_id		ctr
	123		50.00
	234		100.00


---

## 💡 Approach


## 💻 SQL Solution

```sql
SELECT 
    app_id,
    ROUND(
        100.0 * SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) 
        / NULLIF(SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END), 0), 
    2) AS ctr_percentage
FROM events
WHERE timestamp >= '2022-01-01' AND timestamp < '2023-01-01'
GROUP BY app_id;
