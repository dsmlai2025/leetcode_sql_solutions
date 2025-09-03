# Problem 16 - Total Sales Revenue

---

## 📄 Problem Statement
What is the total sales revenue of Samantha and Lisa? 

**Table:** sales_performance

CREATE TABLE sales_performance (salesperson VARCHAR(50),widget_sales INT,sales_revenue INT,id INT PRIMARY KEY); 

INSERT INTO sales_performance (salesperson, widget_sales, sales_revenue, id) VALUES('Jim', 810, 40500, 1),('Bobby', 661, 33050, 2),('Samantha', 1006, 50300, 3),('Taylor', 984, 49200, 4),('Tom', 403, 20150, 5),('Pat', 715, 35750, 6),('Lisa', 1247, 62350, 7); ------------ I have provided an explanation and query, but I encourage you to try solving it first. Later, you can check the query for reference. 


---

### Task
FILL

---

## 🧪 Example

**Output**
FILL

---

## 💡 Approach

- Use WHERE clause

---

## 💻 SQL Solution

```sql
SELECT 
    SUM(sales_revenue) AS total_sales_revenue
FROM sales_performance
WHERE salesperson IN ('Samantha', 'Lisa');
