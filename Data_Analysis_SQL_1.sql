-- =========================================
-- Lesson 9 - SQL for Data Analysts
-- Students Database
-- =========================================

-- Create table
CREATE TABLE Students (
    id INTEGER PRIMARY KEY,
    Name TEXT,
    Gender TEXT,
    City TEXT,
    Math INTEGER,
    English INTEGER,
    Science INTEGER
);

-- Insert data
INSERT INTO Students (id, Name, Gender, City, Math, English, Science)
VALUES
(1, 'Ali', 'Male', 'Lahore', 85, 78, 90),
(2, 'Sara', 'Female', 'Multan', 92, 88, 95),
(3, 'Ahmed', 'Male', 'Lahore', 76, 82, 80),
(4, 'Ayesha', 'Female', 'Multan', 95, 90, 93),
(5, 'Usman', 'Male', 'Lahore', 88, 75, 86),
(6, 'Hina', 'Female', 'Multan', 90, 92, 89);

-- =========================================
-- View the complete table
-- =========================================

SELECT *
FROM Students;

-- =========================================
-- PART 1: BASIC SQL
-- =========================================

-- Task 1
SELECT *
FROM students;


-- Task 2
SELECT name, city
FROM students;


-- Task 3
SELECT *
FROM students
WHERE science > 85;


-- Task 4
SELECT *
FROM students
WHERE city = 'Multan';


--Task 5
SELECT *
FROM students
WHERE math >= 90;


--Task 6
SELECT name , science
FROM students
ORDER BY science DESC;


--Task 7
SELECT *
FROM students
ORDER BY science DESC
LIMIT 3;


--Task 8
SELECT *
FROM students
WHERE math >= 90
ORDER BY math DESC
LIMIT 3;


-- =========================================
-- Lesson 9 — Part 2: Advanced Filtering in SQL
-- Students Database
-- =========================================


SELECT Name, City, Math, Science
FROM Students
WHERE Gender = 'Female'
AND City IN ('Lahore', 'Multan')
AND Math >= 90
ORDER BY Science DESC
LIMIT 3;


--Task 1
SELECT *
FROM students
WHERE gender = 'Female'
AND math >= 90;


--Task 2
SELECT *
FROM students
WHERE gender = 'Male'
OR science >= 90;


--Task 3
SELECT *
FROM students
WHERE city IN ('Lahore' , 'Multan');


--Task 4
SELECT *
FROM students
WHERE math BETWEEN 80 AND 90;


--Task 5
SELECT *
FROM students
WHERE name LIKE 'A%';


--Task 6
SELECT *
FROM students
WHERE name LIKE '%a';


--Task 7
SELECT *
FROM students
WHERE gender = 'Female'
AND science >= 90
ORDER BY science DESC;


--Task 8
SELECT name , math , science
FROM students
WHERE gender = 'Female'
AND ( math >= 90 AND science >= 90 );


--Task 9
SELECT *
FROM students
WHERE gender = 'Female'
AND math >= 90
ORDER BY science DESC
LIMIT 2;