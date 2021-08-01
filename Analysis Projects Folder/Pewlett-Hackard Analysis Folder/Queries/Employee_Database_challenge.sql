select
e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
into retirement_titles
from employees as e
join titles as t
	on e.emp_no = t.emp_no
where (e.birth_date between '1952-01-01' and '1955-12-31')
order by emp_no asc;

-- Use Dictinct with Orderby to remove duplicate rows
select distinct on (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
into unique_titles 
from retirement_titles as rt
order by emp_no asc, to_date desc;


select
count(ut.emp_no) as employee_count,
ut.title
INTO retiring_titles
from unique_titles as ut
group by title 
order by employee_count desc;


SELECT DISTINCT ON(e.emp_no)e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
--DISTINCT ON(emp_no)
--INTO mentor_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
