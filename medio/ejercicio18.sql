with salary_per_department as (
    select
        department,
        max(salary) as salary
    from employee
    group by department
)

select 
E.first_name,
S.department,
max(E.salary) as salary
from salary_per_department S
inner join employee E on E.department = S.department
group by E.first_name, S.department, S.salary
having max(E.salary) = S.salary