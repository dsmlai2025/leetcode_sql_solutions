# Problem 16 - MaxRatingByUserAndHighestMovieRating


## 📄 Problem Statement
Write a solution to:
Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name. 

**Table:** 

Movies 
| movie_id    |  title       |
|-------|--------------|
| 1           | Avengers     |
| 2           | Frozen 2     |
| 3           | Joker        |

Users
| user_id     |  name        |
|-------|--------------|
| 1           | Daniel       |
| 2           | Monica       |
| 3           | Maria        |
| 4           | James        |

MovieRating table:
| movie_id    | user_id      | rating       | created_at  |
|-------------|--------------|--------------|-------------|
| 1           | 1            | 3            | 2020-01-12  |
| 1           | 2            | 4            | 2020-02-11  |
| 1           | 3            | 2            | 2020-02-12  |
| 1           | 4            | 1            | 2020-01-01  |
| 2           | 1            | 5            | 2020-02-17  | 
| 2           | 2            | 2            | 2020-02-01  | 
| 2           | 3            | 2            | 2020-03-01  |
| 3           | 1            | 3            | 2020-02-22  | 
| 3           | 2            | 4            | 2020-02-25  | 

## 🧪 Example

**Output**
| results      |
|-------|
| Daniel       |
| Frozen 2     |

## 💡 Approach


## 💻 SQL Solution

```sql
(SELECT
u.name AS results
FROM MovieRating mr
JOIN Users u
ON u.user_id = mr.user_id
#WHERE YEAR(created_at) = 2020 AND month(created_at) = 02
GROUP BY mr.user_id
ORDER BY COUNT(mr.user_id) DESC, u.name
LIMIT 1)
UNION ALL
(SELECT
m.title AS results
FROM MovieRating mr
JOIN Movies m
ON m.movie_id = mr.movie_id
WHERE YEAR(created_at) = 2020 AND month(created_at) = 02
GROUP BY mr.movie_id
ORDER BY ROUND(AVG(mr.rating),2) DESC, m.title
LIMIT 1)
