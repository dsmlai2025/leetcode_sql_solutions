# Problem 02 - CVS Health Drugs making Loss

---

## 📄 Problem Statement
CVS Health is analyzing its pharmacy sales data, and how well different products are selling in the market. Each drug is exclusively manufactured by a single manufacturer.
Write a query to identify the manufacturers associated with the drugs that resulted in losses for CVS Health and calculate the total amount of losses incurred.

**Table:** pharmacy_sales

| product_id		| units_sold	| total_sales	| cogs	| manufacturer	| drug| 
| ----| ----| ----| ----| ----| -----| 
| 	156		| 89514		| 3130097.00	| 3427421.73	| Biogen| 	Acyclovir| 
| 	25		| 222331	| 2753546.00	| 2974975.36	| AbbVie | Lamivudine| 
| 	50		| 90484		| 2521023.73	| 2742445.90	| Eli Lilly | Dermasorb TA Complete| 
| 	98		| 110746	| 	813188.82	| 140422.87	| Biogen	| Medi-Chord| 

---

### Task
FILL

---

## 🧪 Example

**Output**
| manufacturer		| drug_count	total_loss| 
| Biogen			| 1	| 	297324.73| 
| AbbVie		| 1		| 221429.36| 
| Eli Lilly		| 1		| 221422.17| 

  
**Explanation:**

FILL



---

## 💡 Approach

- FILL

---

## 💻 SQL Solution

```sql
SELECT
  manufacturer,
  COUNT(drug) AS drug_count,
  ABS(SUM(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales - cogs <= 0
GROUP BY manufacturer
ORDER BY total_loss DESC
