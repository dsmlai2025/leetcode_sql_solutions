# Problem 01 - Unfinished Parts
---

## 📄 Problem Statement
Tesla is investigating production bottlenecks and they need your help to extract the relevant data. 

## Assumptions:
parts_assembly table contains all parts currently in production, each at varying stages of the assembly process.
An unfinished part is one that lacks a finish_date.

**Table:** Sales

| part	|	finish_date		| assembly_step |
| battery	|	01/22/2022 00:00:00		1 |
| battery |	02/22/2022 00:00:00	| 	2| 
| battery	| 	03/22/2022 00:00:00	| 	3| 
| bumper	| 01/22/2022 00:00:00	| 	1| 
| bumper	| 02/22/2022 00:00:00	| 2| 
| bumper	|   | 3 |  
| bumper	| 	|	4 |


---

### Task

Write a query to determine which parts have begun the assembly process but are not yet finished.

---

## 🧪 Example

**Output**

| part |	assembly_step |
| bumper |	3 |
| bumper |	4 |
  
**Explanation:**

- Filter by IS NULL

---

## 💡 Approach

- Use a simple WHERE clause

---

## ✅ Solution

```sql
SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;
