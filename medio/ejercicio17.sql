select 
first_name,
max(target) as target
from salesforce_employees
where manager_id = 13
group by first_name
having max(target) = (
    select
        max(target) as target
    from salesforce_employees
    where manager_id = 13
)