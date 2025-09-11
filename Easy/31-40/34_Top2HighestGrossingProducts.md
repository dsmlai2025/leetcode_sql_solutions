# Problem 34 - Amazon Top 2 Highest Grossing Products

## 📄 Problem Statement
Assume you're given a table containing data on Amazon customers and their spending on products in different category, write a query to identify the top two highest-grossing products within each category in the year 2022. 
The output should include the category, product, and total spend. 

Calculate fuel efficiency as distance_km / fuel_consumed for each trip
First half: January to June, Second half: July to December
Only include drivers who have trips in both halves of the year
Calculate the efficiency improvement as (second_half_avg - first_half_avg)
Round all results to 2 decimal places
Return the result table ordered by efficiency improvement in descending order, then by driver name in ascending order.
**Table:** 

Input: Product_Spend
| category	| product |		user_id	| spend		| transaction_date |
|--------|-------|-------| -------| -------| 
|appliance	| refrigerator		| 165		|246.00		|12/26/2021 12:00:00|
|appliance	| refrigerator		| 123		|299.99		|03/02/2022 12:00:00|
|appliance	| washing machine	| 123		|219.80		|03/02/2022 12:00:00|
|electronics	| vacuum		| 178		|152.00		|04/05/2022 12:00:00|
|electronics	| wireless headset	|156		|249.90		|07/08/2022 12:00:00|
|electronics	| vacuum		|145		|189.00		|07/15/2022 12:00:00|

## 💡 Approach
The person with id 3 is a friend of people 1, 2, and 4, so he has three friends in total, which is the most number than any others.

## 💻 SQL Solution

```sql
WITH ranked_spending_cte AS (
  SELECT 
    category, 
    product, 
    SUM(spend) AS total_spend,
    RANK() OVER (
      PARTITION BY category 
      ORDER BY SUM(spend) DESC) AS ranking 
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY category, product
)

SELECT 
  category, 
  product, 
  total_spend 
FROM ranked_spending_cte 
WHERE ranking <= 2 
ORDER BY category, ranking;
