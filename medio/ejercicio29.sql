-- Filters to keep in mind: count(employees) >= 5 and year(joining_date) > 2020
--Return: name of department, headcount(number of employees per department), total payroll (total sum of salary), and average salary (avg)
select
department,
count(id) as headcount,
sum(salary) as tota_payroll,
avg(cast(salary as decimal)) as average_salary
from techcorp_workforce
where year(joining_date) > 2020
group by department
having count(id) >= 5