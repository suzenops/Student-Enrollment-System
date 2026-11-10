-- Optional PostgreSQL schema and sample data for the same domain model.
-- The browser demo uses localStorage and does NOT connect to this database.
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_code VARCHAR(10) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL CHECK (credits > 0)
);
CREATE TABLE enrollments (
    student_id INT NOT NULL REFERENCES students(student_id),
    course_id INT NOT NULL REFERENCES courses(course_id),
    registration_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO students (student_id, first_name, last_name, email) VALUES
(1, 'James', 'John', 'jj@gmail.com'),
(2, 'David', 'Smith', 'david@gmail.com'),
(3, 'Grace', 'Kimani', 'grace@gmail.com'),
(4, 'James', 'Brown', 'james@gmail.com'),
(5, 'Sarah', 'Williams', 'sarah@gmail.com');

INSERT INTO courses (course_id, course_name, course_code, credits) VALUES
(101, 'Database Systems', 'MAC250', 3),
(102, 'Cybersecurity', 'MAC227', 3),
(103, 'Linux Administration', 'MAC232', 3),
(104, 'Python Programming', 'MAC190', 3);

INSERT INTO enrollments (student_id, course_id, registration_date) VALUES
(1, 101, '2026-11-01'),
(2, 102, '2026-11-01'),
(3, 103, '2026-11-01'),
(4, 101, '2026-11-01'),
(5, 104, '2026-11-01');

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;
