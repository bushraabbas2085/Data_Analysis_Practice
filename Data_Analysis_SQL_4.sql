--=======================================
--Lesson 9 - Part 7 - Advanced SQL JOINS
--=======================================

--Task 1
SELECT
    s.name,
    d.department,
    d.semester
FROM students AS s
INNER JOIN student_details AS d
    ON s.id = d.student_id;
	
--Task 2
SELECT 
    s.name,
	d.department,
	s.math,
	s.science
FROM students AS s
INNER JOIN student_details AS d
    ON s.id = d.student_id
WHERE d.department = 'Data Science';

--Task 3
SELECT
	d.department,
	ROUND(AVG(s.math) , 2) AS Average_math_marks
FROM students AS s
INNER JOIN student_details AS d
    ON s.id = d.student_id
GROUP BY d.department;

--Task 4
SELECT
	d.department,
	COUNT(*) AS No_of_Students
FROM students AS s
INNER JOIN student_details AS d
    ON s.id = d.student_id
GROUP BY d.department;

--Task 5
SELECT
	d.department,
	ROUND(AVG(s.science) , 2) AS Average_science_marks
FROM students AS s
INNER JOIN student_details AS d
    ON s.id = d.student_id
GROUP BY d.department
HAVING AVG(s.science) > 85 ;

--Task 6
SELECT
    s.id,
    s.name
FROM students AS s
LEFT JOIN student_details AS d
    ON s.id = d.student_id
WHERE d.student_id IS NULL;

--Task 7
SELECT
    s.name,
	s.gender,
    d.department,
    d.semester,
	s.math + s.science + s.english AS total_marks
FROM students AS s
INNER JOIN student_details AS d
    ON s.id = d.student_id
ORDER BY total_marks DESC
LIMIT 3;

--Task 8
SELECT
    s.name,
	s.math,
    s.english,
    s.science,
	s.math + s.science + s.english AS total_marks
FROM students AS s
INNER JOIN student_details AS d
    ON s.id = d.student_id
WHERE d.department = 'Data Science'
ORDER BY total_marks DESC
LIMIT 2;

--Task 9 - Challenge
SELECT
	d.department,
	ROUND(AVG(s.math + s.science + s.english),2)AS avg_total_marks
FROM students AS s
INNER JOIN student_details AS d
    ON s.id = d.student_id
GROUP BY d.department
ORDER BY avg_total_marks DESC ;


--=========================================
--Lesson 9 - Part 8 - SQL Subqueries & CTEs
--CTEs(Common Table Expressions)
--=========================================

--Task 1
SELECT name , math 
FROM students
WHERE math > (
     SELECT AVG(math)
	 FROM students
);

--Task 2
SELECT name , science
FROM students
WHERE science =  (
     SELECT MAX(science)
	 FROM students
);

--Task 3
SELECT name , math 
FROM students
WHERE math = (
     SELECT MIN(math)
	 FROM students
);

--Task 4
SELECT s.name , d.department , d.semester 
FROM students AS s
INNER JOIN student_details as d
    ON s.id = d.student_id
WHERE s.id IN (
     SELECT d.student_id
	 FROM  student_details
	 WHERE d.semester = 8
);

--Task 5
WITH total_marks AS(
    SELECT name ,math + science + english AS total
	FROM students
)
SELECT * FROM total_marks;

--Task 6
WITH highly_marked_students AS (
    SELECT 
        name,
        math + science + english AS total
    FROM students
)
SELECT 
    name,
    total
FROM highly_marked_students
WHERE total > (
    SELECT AVG(total)
    FROM highly_marked_students
);

--Task 7
WITH avg_marks AS(
    SELECT 
	   d.department, AVG(s.math) AS avg_math
    FROM students AS s
    INNER JOIN student_details AS d
       ON s.id = d.student_id
    GROUP BY d.department
)
SELECT department , ROUND(avg_math) AS avg_math
FROM avg_marks
ORDER BY avg_math DESC;

--Task 8 - Challenge
WITH avg_marks AS(
    SELECT 
	   d.department, 
	   AVG(s.math + s.science + s.english)
	   AS avg_total_marks
    FROM students AS s
    INNER JOIN student_details AS d
       ON s.id = d.student_id
    GROUP BY d.department
)
SELECT department , ROUND(avg_total_marks) AS avg_total
FROM avg_marks
ORDER BY avg_total DESC
LIMIT 1;