with full_bonus as (
    select 
        worker_ref_id,
        sum(bonus) as bonus
    from sf_bonus
    group by worker_ref_id
),

full_data as (
    select 
        E.employee_title as Employee_Title,
        E.sex as Gender,
        e.salary + F.bonus as full_salary
    from sf_employee E
    right join full_bonus F on E.id = F.worker_ref_id
)

select Employee_Title, Gender, AVG(full_salary) as AVG_compensation from full_data group by Employee_Title, Gender