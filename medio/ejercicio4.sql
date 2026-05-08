with prorrated_employees as (select
P.title,
P.budget,
sum(e.salary) as salary,
ceiling(
    sum(e.salary)
    *
    (datediff(day,P.start_date,P.end_date) * 1.0)/365)
    as prorated_employee_expense
from 
linkedin_projects P
inner join linkedin_emp_projects EP on P.id = EP.project_id
inner join linkedin_employees E on E.id = EP.emp_id
group by P.title,
P.start_date,
P.end_date,
P.budget)

select title, budget, prorated_employee_expense from prorrated_employees where prorated_employee_expense > budget