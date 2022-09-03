-- Deliverable 1
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Export table to CSV
COPY retirement_titles TO 'C:\\retirement_titles.csv' DELIMITER ',' CSV HEADER;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Export table to CSV
COPY unique_titles TO 'C:\\unique_titles.csv' DELIMITER ',' CSV HEADER;


-- Retiring titles
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

-- Export table to CSV
COPY retiring_titles TO 'C:\\retiring_titles.csv' DELIMITER ',' CSV HEADER;



-- Deliverable 2
SELECT DISTINCT ON(e.emp_no) e.emp_no,
		e.first_name, 
		e.last_name, 
		e.birth_date,
		de.from_date,
		de.to_date,
		ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
INNER JOIN titles AS ti
	ON e.emp_no = ti.emp_no
WHERE de.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no;

-- Export table to CSV
COPY mentorship_eligibility TO 'C:\\mentorship_eligibility.csv' DELIMITER ',' CSV HEADER;