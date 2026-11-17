--=================================================
--Lesson 9 — Part 5: Subqueries & Advanced Analysis
--=================================================

--Task 1
SELECT name , math
FROM students
WHERE math >(
        SELECT AVG(math)
	    FROM students
)
ORDER BY math DESC;

--Task 2
SELECT name , science
FROM students
WHERE science >(
        SELECT AVG(science)
	    FROM students
)
ORDER BY math DESC;

--Task 3
SELECT name , math
FROM students
WHERE math = (
        SELECT MAX(math)
	    FROM students
);

--Task 4
SELECT name , science
FROM students
WHERE science = (
        SELECT MIN(science)
	    FROM students
);

--Task 5
SELECT name , (math+english+science) as total_marks
FROM students
WHERE (math+english+science) >(
        SELECT AVG((math+english+science))
	    FROM students
);

--Task 6
SELECT name , (math+english+science) as total_marks
FROM students
WHERE (math+english+science) = (
        SELECT MAX((math+english+science))
	    FROM students
);

--Task 7
SELECT name , english
FROM students
WHERE english < (
        SELECT AVG(english)
	    FROM students
);

--Task 8
SELECT name , (math+english+science)/3.0 as Average_marks
FROM students
WHERE (math+english+science)/3.0 > (
        SELECT AVG((math+english+science)/3.0)
	    FROM students
);


--============================
--Lesson 9 — Part 6: SQL JOINS 
--============================

--Create a new table
CREATE TABLE student_details (
    student_id INTEGER,
    department VARCHAR(100),
    semester INTEGER
);

--Insert Data in it
INSERT INTO student_details
    (student_id, department, semester)
VALUES
(1, 'Computer Science', 8),
(2, 'Software Engineering', 7),
(3, 'Computer Science', 6),
(4, 'Data Science', 8),
(5, 'Software Engineering', 6),
(6, 'Data Science', 7);

--Check the table 
SELECT * FROM student_details;

--Task 1 - Using INNER JOIN
SELECT
    s.name,
    d.department,
    d.semester
FROM students AS s
INNER JOIN student_details AS d
    ON s.id = d.student_id;
	
--Task 2 - INNER JOIN + Marks
SELECT
    s.name,
	s.math,
	s.science,
    d.department,
    d.semester
FROM students AS s
INNER JOIN student_details AS d
    ON s.id = d.student_id;
	
--Task 3 - INNER JOIN + WHERE
SELECT
    s.name,
    d.department,
    d.semester
FROM students AS s
INNER JOIN student_details AS d
    ON s.id = d.student_id
WHERE d.department = 'Data Science';

--Task 4 - Semester Filter
SELECT
    s.name,
    d.department,
    d.semester
FROM students AS s
INNER JOIN student_details AS d
    ON s.id = d.student_id
WHERE d.semester = 8 ;

--Task 5 - JOIN + Calculated Column
SELECT
    s.name,
    d.department,
	(s.math + s.science + s.english) AS total_marks
FROM students AS s
INNER JOIN student_details AS d
    ON s.id = d.student_id
	
--Task 6 - Math marks above 90
SELECT
    s.name,
    d.department,
    s.math
FROM students AS s
INNER JOIN student_details AS d
    ON s.id = d.student_id
WHERE s.math >= 90 ;

--Task 7 - LEFT JOIN
SELECT
    s.name,
	s.city,
    d.department
FROM students AS s
LEFT JOIN student_details AS d
    ON s.id = d.student_id
	
--Task 8 - JOIN + ORDER BY
SELECT
    s.name,
    d.department,
	ROUND((s.math + s.science + s.english)/3.0,2) AS Average_marks
FROM students AS s
INNER JOIN student_details AS d
    ON s.id = d.student_id
ORDER BY Average_marks DESC;

--Task 9 - Challenge
SELECT
    s.name,
    s.gender,
    s.city,
    d.department,
    d.semester,
    (s.math + s.science + s.english) AS total_marks,
    ROUND((s.math + s.science + s.english) / 3.0, 2) AS average_marks
FROM students AS s
INNER JOIN student_details AS d
    ON s.id = d.student_id
ORDER BY total_marks DESC;

--| JOIN              | What does it keep?                            |
--| ----------------- | --------------------------------------------- |
--| `INNER JOIN`      | Matching rows from both                       |
--| `LEFT JOIN`       | **All rows from LEFT table** + matching right |
--| `RIGHT JOIN`      | **All rows from RIGHT table** + matching left |
--| `FULL OUTER JOIN` | **All rows from both tables**                 |
