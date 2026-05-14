select
E.first_name,
E.salary
from employee E
inner join employee M on M.id = E.manager_id
where E.salary > M.salary