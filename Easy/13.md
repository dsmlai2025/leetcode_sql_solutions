# Problem 13 - Bloomberg Terminal - H, L Open prices by month_year

---

## 📄 Problem Statement
The Bloomberg terminal is the go-to resource for financial professionals, offering convenient access to a wide array of financial datasets. 
As a Data Analyst at Bloomberg, you have access to historical data on stock performance.


**Table:** 

| date	| 	ticker	| 	open	| high	| low	| close| 
| --- | ---| ---| ---| ---| ---| 
| 01/31/2023 00:00:00| 	AAPL		| 142.28	| 142.70	| 144.34	| 144.29| 
| 02/28/2023 00:00:00	| AAPL		| 146.83	| 147.05	| 149.08	| 147.41| 
| 03/31/2023 00:00:00	| AAPL		| 161.91	| 162.44	| 165.00	| 164.90| 
| 04/30/2023 00:00:00	| AAPL		| 167.88	| 168.49	| 169.85	| 169.68| 
| 05/31/2023 00:00:00	| AAPL	| 	176.76	| 177.33	| 179.35	| 177.25| 

---

### Task
Currently, you're analyzing the highest and lowest open prices for each FAANG stock by month over the years.
For each FAANG stock, display the ticker symbol, the month and year ('Mon-YYYY') with the corresponding highest and lowest open prices (refer to the Example Output format). 
Ensure that the results are sorted by ticker symbol.

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
  ticker,
  DATE_FORMAT(date, '%b-%Y') AS month_year,
  MAX(open) AS highest_open,
  MIN(open) AS lowest_open
FROM stock_prices
GROUP BY ticker, month_year
ORDER BY ticker, DATE_FORMAT(date, '%b-%Y');
