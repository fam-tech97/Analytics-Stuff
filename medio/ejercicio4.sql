with data as (
    select 
        P.title as title,
        P.budget as budget,
        ceiling(sum(E.salary) * (cast(datediff(day, P.start_date, P.end_date) as decimal) / 365)) as prorated_employee_expense
    from linkedin_projects P
    inner join linkedin_emp_projects EP on P.id = EP.project_id
    inner join linkedin_employees E on EP.emp_id = E.id
    group by P.title, P.budget, P.start_date, P.end_date
)

select * from data where prorated_employee_expense > budget