# Problem 18 - Top 3 Profitable Drugs


---

## 📄 Problem Statement
CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. 
Each drug can only be produced by one manufacturer.

**Table:** pharmacy_sales

| product_id	| units_sold	| total_sales| 	cogs		| manufacturer	| drug| 
| ---| ---| ---| ---|--- |---|
| 	9	| 37410		| 293452.54	| 208876.01	| Eli Lilly	| Zyprexa| 
| 	34	| 94698		|600997.19	| 521182.16	| AstraZeneca	| Surmontil| 
| 	61	| 77023		| 500101.61	| 419174.97	| Biogen	| Varicose Relief| 
| 	136	| 144814	| 1084258	| 1006447.73	| Biogen	| Burkhart| 

---

### Task
Write a query to find the top 3 most profitable drugs sold, and how much profit they made. 
Assume that there are no ties in the profits. Display the result from the highest to the lowest total profit.

---

## 🧪 Example

**Output**
| drug	| total_profit
| Zyprexa	| 84576.53| 
| Varicose Relief | 	80926.64| 
| Surmontil	| 79815.03| 

  
**Explanation:**

FILL



---

## 💡 Approach

- FILL

---

## 💻 SQL Solution

```sql
SELECT
  drug,
  total_sales - cogs AS total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC
LIMIT 3
