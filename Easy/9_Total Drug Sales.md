# Problem 09 - Total Drug Sales

---

## 📄 Problem Statement
CVS Health wants to gain a clearer understanding of its pharmacy sales and the performance of various products.
Write a query to calculate the total drug sales for each manufacturer. Round the answer to the nearest million and report your results in descending order of total sales. In case of any duplicates, sort them alphabetically by the manufacturer name.
Since this data will be displayed on a dashboard viewed by business stakeholders, please format your results as follows: "$36 million”.

**Table:** 

| product_id| units_sold| total_sales| cogs| manufacturer| drug| 
| ------| ------| ------| ------| ------| ------| 
| 94| 132362| 2041758.41| 1373721.70| Biogen | UP and UP| 
| 9| 37410| 293452.54| 208876.01| Eli Lilly | 	Zyprexa| 
| 50| 90484| 2521023.73| 2742445.9	| Eli Lilly| Dermasorb| 
| 61| 77023| 500101.61| 419174.97	| Biogen | Varicose Relief| 
| 136| 144814| 1084258.00| 1006447.73| Biogen| Burkhart| 



---

### Task
FILL

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
SELECT 
  manufacturer, 
  CONCAT( '$', ROUND(SUM(total_sales) / 1000000), ' million') AS sales_mil 
FROM pharmacy_sales 
GROUP BY manufacturer 
ORDER BY SUM(total_sales) DESC, manufacturer
