SELECT e.emp_no,
e.first_name, 
e.last_name,
t.title, 
t.from_date, 
t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON t.emp_no = e.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

SELECT * FROM retirement_titles

SELECT r.emp_no,
r.first_name, 
r.last_name,
r.title
FROM retirement_titles as r


SELECT DISTINCT ON (r.emp_no) r.emp_no,r.first_name,r.last_name,r.title
FROM retirement_titles as r
WHERE r.to_date = '9999-01-01'


SELECT DISTINCT ON (r.emp_no) r.emp_no,r.first_name,r.last_name,r.title
INTO unique_titles
FROM retirement_titles as r
WHERE r.to_date = '9999-01-01'
ORDER BY r.emp_no, r.to_date DESC;

SELECT * FROM unique_titles

SELECT COUNT(title) FROM unique_titles

SELECT COUNT(u.title),u.title
INTO retiring_titles
FROM unique_titles as u
GROUP BY u.title
ORDER BY COUNT(u.title) DESC, u.title;

SELECT * FROM retiring_titles

SELECT emp.emp_no,
emp.first_name, 
emp.last_name,
emp.birth_date,
emp.from_date, 
emp.to_date,
ti.title
INTO mentorship_eligibility1
FROM mentorship1 as emp
INNER JOIN titles as ti
ON ti.emp_no = emp.emp_no
WHERE emp.to_date = '9999-01-01'
AND emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp.emp_no;
SELECT * FROM mentorship_eligibility1

SELECT DISTINCT ON (emp.emp_no) emp.emp_no,emp.first_name,emp.last_name,emp.birth_date,emp.from_date, emp.to_date,emp.title
INTO mentorship_eligibility
FROM mentorship_eligibility1 as emp;

SELECT * FROM mentorship_eligibility