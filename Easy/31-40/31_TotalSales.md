# Problem 31 - Total Sales

## 📄 Problem Statement
You work for a multinational company that wants to calculate total sales across all their countries they do business in. You have 2 tables, one is a record of sales for all countries and currencies the company deals with, and the other holds currency exchange rate information. 
Calculate the total sales, per quarter, for the first 2 quarters in 2020, and report the sales in USD currency.

**Table:** 

𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭
CREATE TABLE sf_exchange_rate ( date DATE, exchange_rate FLOAT, source_currency VARCHAR(10), target_currency VARCHAR(10)); 

INSERT INTO sf_exchange_rate (date, exchange_rate, source_currency, target_currency) VALUES ('2020-01-15', 1.1, 'EUR', 'USD'), ('2020-01-15', 1.3, 'GBP', 'USD'), ('2020-02-05', 1.2, 'EUR', 'USD'), ('2020-02-05', 1.35, 'GBP', 'USD'), ('2020-03-25', 1.15, 'EUR', 'USD'), ('2020-03-25', 1.4, 'GBP', 'USD'), ('2020-04-15', 1.2, 'EUR', 'USD'), ('2020-04-15', 1.45, 'GBP', 'USD'), ('2020-05-10', 1.1, 'EUR', 'USD'), ('2020-05-10', 1.3, 'GBP', 'USD'), ('2020-06-05', 1.05, 'EUR', 'USD'), ('2020-06-05', 1.25, 'GBP', 'USD'); 

CREATE TABLE sf_sales_amount ( currency VARCHAR(10), sales_amount BIGINT, sales_date DATE); 

INSERT INTO sf_sales_amount (currency, sales_amount, sales_date) VALUES ('USD', 1000, '2020-01-15'), ('EUR', 2000, '2020-01-20'), ('GBP', 1500, '2020-02-05'), ('USD', 2500, '2020-02-10'), ('EUR', 1800, '2020-03-25'), ('GBP', 2200, '2020-03-30'), ('USD', 3000, '2020-04-15'), ('EUR', 1700, '2020-04-20'), ('GBP', 2000, '2020-05-10'), ('USD', 3500, '2020-05-25'), ('EUR', 1900, '2020-06-05'), ('GBP', 2100, '2020-06-10'); 


## 🧪 Example

**Output**
FILL

---

## 💡 Approach

Date Filtering: The query filters sf_sales_amount for sales occurring in the first two quarters of 2020 using the WHERE clause. 
Currency Conversion: Joins sf_sales_amount with sf_exchange_rate to apply the exchange rate where the source_currency in sf_sales_amount matches the sf_exchange_rate and the target_currency is 'USD'. 
Quarterly Aggregation: Groups the data by the quarter of the sales date using DATEPART(QUARTER, sa.sales_date). 
Sum of Sales: Calculates the total sales in USD for each quarter by multiplying the sales_amount by the exchange_rate and summing it up.
---

## 💻 SQL Solution

```sql
SELECT 
    QUARTER(s.sales_date) AS quarter_num,
    SUM(
        CASE 
            WHEN s.currency = 'USD' THEN s.sales_amount
            ELSE s.sales_amount * e.exchange_rate
        END
    ) AS total_sales_usd
FROM sf_sales_amount s
LEFT JOIN sf_exchange_rate e
    ON s.currency = e.source_currency
   AND s.sales_date = e.date
WHERE YEAR(s.sales_date) = 2020
  AND QUARTER(s.sales_date) IN (1, 2)
GROUP BY QUARTER(s.sales_date)
ORDER BY quarter_num;
