select 
e1.id as employee_1,
e2.id as employee_2
from 
facebook_employees E1
inner join facebook_employees E2 
on E1.location = E2.location and
E1.age <> E2.age and
E1.gender = E2.gender
and E1.is_senior <> E2.is_senior