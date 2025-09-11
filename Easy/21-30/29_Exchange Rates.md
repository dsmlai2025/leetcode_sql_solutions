# Problem 29 - Top 2 hotels with reviews

## 📄 Problem Statement
You are given a list of exchange rates from various currencies to US Dollars (USD) in different months. Show how the exchange rate of all the currencies changed in the first half of 2020. Output the currency code and the difference between values of the exchange rate between July 1, 2020 and January 1, 2020.

**Table:** 

𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭
CREATE TABLE sf_exchange_rates ( date DATETIME, exchange_rate FLOAT, source_currency VARCHAR(10), target_currency VARCHAR(10)); 

INSERT INTO sf_exchange_rates (date, exchange_rate, source_currency, target_currency) VALUES ('2020-01-01', 1.12, 'EUR', 'USD'), ('2020-01-01', 1.31, 'GBP', 'USD'), ('2020-01-01', 109.56, 'JPY', 'USD'), ('2020-07-01', 1.17, 'EUR', 'USD'), ('2020-07-01', 1.29, 'GBP', 'USD'), ('2020-07-01', 109.66, 'JPY', 'USD'), ('2020-01-01', 0.75, 'AUD', 'USD'), ('2020-07-01', 0.73, 'AUD', 'USD'), ('2020-01-01', 6.98, 'CNY', 'USD'), ('2020-07-01', 7.05, 'CNY', 'USD'); ————


## 🧪 Example

**Output**
FILL

---

## 💡 Approach

1. WITH exchange_rate_changes: Filters the data to only consider date values of January 1, 2020, and July 1, 2020. Uses MAX(CASE ...) to capture the exchange rate for these specific dates for each source_currency. 
2. COALESCE(rate_july, 0) - COALESCE(rate_jan, 0): Calculates the difference in exchange rates. If data is missing for any date, it replaces the rate with 0 using COALESCE. 
3. GROUP BY: Groups by the currency code (source_currency).
---

## 💻 SQL Solution

```sql
WITH rates_jan AS (
    SELECT source_currency, exchange_rate AS rate_jan
    FROM sf_exchange_rates
    WHERE date = '2020-01-01'
),
rates_jul AS (
    SELECT source_currency, exchange_rate AS rate_jul
    FROM sf_exchange_rates
    WHERE date = '2020-07-01'
)
SELECT
    r_jan.source_currency,
    r_jul.rate_jul - r_jan.rate_jan AS exchange_rate_difference
FROM rates_jan r_jan
JOIN rates_jul r_jul 
ON r_jan.source_currency = r_jul.source_currency
ORDER BY r_jan.source_currency;
