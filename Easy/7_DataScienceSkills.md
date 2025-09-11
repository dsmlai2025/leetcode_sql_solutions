# Problem 07 - Data Science Skills

---

## 📄 Problem Statement
Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job.
**Table:** 

| candidate_id	 | skill |
|--------------|---------|
| 123 |	Python |
| 123 |	Tableau |
| 123 |	PostgreSQL |
| 234 |	R |
| 234 |	PowerBI |
| | 234 |	SQL Server |
| 345 |	Python |
| 345 |	Tableau |

---

### Task
You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.

---

## 🧪 Example

**Output**
| candidate_id  |
| ---- |
| 123 |

  
**Explanation:**


---

## 💡 Approach

- GROUP BY, HAVING

---

## 💻 SQL Solution

```sql
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;
