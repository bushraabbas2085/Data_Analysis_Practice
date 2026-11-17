-- =========================================
--Lesson 9 — Part 3: Aggregation & GROUP BY
-- =========================================

--Task 1 
SELECT COUNT(*) AS total_students
FROM students;

--Task 2
SELECT SUM(math) AS total_math_marks
FROM students;

--Task 3
SELECT AVG(english) AS Average_English
FROM students;

--Task 4
SELECT MAX(science) AS highest_science
FROM students;

--Task 5
SELECT MIN(math) AS lowest_math
FROM students;

--Task 6
SELECT gender , AVG(math) AS Avg_math_marks
FROM students
GROUP BY gender;

--Task 7
SELECT city , COUNT(*) AS total_students
FROM students
GROUP BY city;

--Task 8
SELECT city , AVG(science) AS Average_science
FROM students
GROUP BY city;

--Task 9
SELECT gender ,
COUNT(*) AS total_students,
AVG(math) AS Avg_math_marks,
AVG(english) AS Avg_english_marks,
AVG(science) AS Avg_science_marks
FROM students
GROUP BY gender;

--Task 10
SELECT gender , AVG(math) AS Avg_math_marks
FROM students
GROUP BY gender
HAVING AVG(math) > 85;

--Task 11
SELECT city ,
COUNT(*) AS total_students,
AVG(math) AS Avg_math_marks,
MAX(science) AS highest_science
FROM students
GROUP BY city
ORDER BY AVG(math) DESC;

-- ==========================================
--Lesson 9 — Part 4: CASE & Calculated Values
-- ==========================================

--Task 1
SELECT name , math , english , science,
math + english + science AS total_marks
FROM students;

--Task 2
SELECT
math + english + science AS total_marks ,
ROUND((math + english + science) / 3.0, 2) AS average_marks
FROM students;

--Task 3
SELECT name , math , english , science,
CASE
  WHEN math >= 90 THEN 'Excellent'
  WHEN math >= 80 THEN 'Good'
  ELSE 'Needs Improvement'
END AS math_performance
FROM students;

--Task 4
SELECT name , math , english , science,
CASE
  WHEN math >= 90 THEN 'A'
  WHEN math >= 80 AND math < 90 THEN 'B'
  WHEN math >= 70 AND math < 80 THEN 'C'
  ELSE 'F'
END AS math_grade
FROM students;

--Task 5
SELECT name,
math + english + science AS total_marks
FROM students
WHERE (math + english + science) > 250;

--Task 6
SELECT name,
math + english + science AS total_marks ,
ROUND((math + english + science) / 3.0, 2) AS average_marks,
CASE
  WHEN (math + english + science) >= 270 THEN 'Excellent'
  WHEN (math + english + science) >=240 
  AND (math + english + science) < 270 THEN 'Good'
  ELSE 'Needs Improvement'
END AS performance
FROM students
ORDER BY total_marks DESC;

--Task 7
SELECT
 CASE
  WHEN math >= 90 THEN 'Excellent'
  WHEN math >= 80 THEN 'Good'
  ELSE 'Needs Improvement'
 END AS math_performance,
 COUNT(*) AS No_of_Students
FROM students
GROUP BY
 CASE
  WHEN math >= 90 THEN 'Excellent'
  WHEN math >= 80 THEN 'Good'
  ELSE 'Needs Improvement'
 END;
 
 --Task 8
SELECT
    name,
    gender,
    city,
    math + english + science AS total_marks,
    ROUND((math + english + science) / 3.0, 2) AS average_marks,
    CASE
        WHEN (math + english + science) / 3.0 >= 90 THEN 'A'
        WHEN (math + english + science) / 3.0 >= 80 THEN 'B'
        WHEN (math + english + science) / 3.0 >= 70 THEN 'C'
        ELSE 'F'
    END AS grade
FROM students
ORDER BY average_marks DESC;