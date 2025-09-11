# Problem 22 - Capital Gain/Loss

## 📄 Problem Statement
Write a solution to report the Capital gain/loss for each stock.
The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock one or many times.
Return the result table in any order. 
**Table:** 

Stocks table:

| stock_name    | operation | operation_day | price  |
|----------------|-----------|---------------|--------|
| Leetcode      | Buy       | 1             | 1000   |
| Corona Masks  | Buy       | 2             | 10     |
| Leetcode      | Sell      | 5             | 9000   |
| Handbags      | Buy       | 17            | 30000  |
| Corona Masks  | Sell      | 3             | 1010   |
| Corona Masks  | Buy       | 4             | 1000   |
| Corona Masks  | Sell      | 5             | 500    |
| Corona Masks  | Buy       | 6             | 1000   |
| Handbags      | Sell      | 29            | 7000   |
| Corona Masks  | Sell      | 10            | 10000  |

## 🧪 Example

**Output**
| stock_name    | capital_gain_loss |
|---------------|-------------------|
| Corona Masks  | 9500              |
| Leetcode      | 8000              |
| Handbags      | -23000            |

## 💡 Approach


## 💻 SQL Solution

```sql
SELECT
stock_name,
SUM(CASE WHEN operation = 'Buy' THEN -price ELSE price END) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name
