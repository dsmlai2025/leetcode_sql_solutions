**The Foundation: What is a Cohort?**

A cohort is simply a group of users who share a common characteristic, typically their first-ever action 
(e.g., first purchase, first website visit, first sign-up).

**Step 1:** Identifying the Cohort Date (The First Action)
The most important part of cohort analysis is defining the cohort date for each customer. This is the date of their very first transaction. We can do this with a simple GROUP BY and MIN() function.

```sql
WITH CustomerFirstPurchase AS (
    SELECT
        CustomerID,
        MIN(OrderDate) AS CohortDate
    FROM
        Orders
    GROUP BY
        CustomerID
)
SELECT * FROM CustomerFirstPurchase;
```
**Step 2:** Calculating the Time Difference (The Key to Cohort Analysis)
Now we need to link every single one of a customer’s subsequent orders back to their original cohort date and calculate the time elapsed. We can do this by joining our Orders table to our CustomerFirstPurchase CTE and using DATE_DIFF (or its equivalent in your database, e.g., DATEDIFF in SQL Server).

```sql
WITH CustomerFirstPurchase AS (
    -- Our query from Step 1
    SELECT
        CustomerID,
        MIN(OrderDate) AS CohortDate
    FROM
        Orders
    GROUP BY
        CustomerID
)
SELECT
    o.CustomerID,
    cfp.CohortDate,
    o.OrderDate AS ActivityDate,
    DATE_DIFF('MONTH', cfp.CohortDate, o.OrderDate) AS MonthsSinceCohort
FROM
    Orders o
JOIN
    CustomerFirstPurchase cfp ON o.CustomerID = cfp.CustomerID;
```
**Step 3:** Building the Final Cohort Retention Table
With the time difference calculated, we can now aggregate the data to create our final, insightful cohort table. We’ll group by the CohortDate and the MonthsSinceCohort to see how many unique customers from each cohort were active in each subsequent month.

```sql
WITH CustomerFirstPurchase AS (
    SELECT
        CustomerID,
        MIN(OrderDate) AS CohortDate
    FROM
        Orders
    GROUP BY
        CustomerID
),
CustomerActivity AS (
    SELECT
        o.CustomerID,
        DATE_TRUNC('month', cfp.CohortDate) AS CohortMonth, -- Truncating to month for our cohorts
        DATE_DIFF('MONTH', cfp.CohortDate, o.OrderDate) AS MonthsSinceCohort
    FROM
        Orders o
    JOIN
        CustomerFirstPurchase cfp ON o.CustomerID = cfp.CustomerID
)
SELECT
    CohortMonth,
    MonthsSinceCohort,
    COUNT(DISTINCT CustomerID) AS RetainedCustomers
FROM
    CustomerActivity
GROUP BY
    1, 2
ORDER BY
    1, 2;
```
This final query produces a table that is the bedrock of your cohort analysis. 
You can now use a BI tool to turn this into a powerful heat map or retention chart that reveals your customer behavior over time.

Your Analyst’s Edge: Beyond the Numbers

**1. Product-Market Fit:** Is your product sticky? Cohort analysis will show if new users are coming back or if your retention rates are falling off a cliff.
**2. Marketing Effectiveness:** Do customers acquired from a specific marketing channel have better retention than others?
**3. Pricing Strategy:** Do customers on a certain pricing tier have higher loyalty?
