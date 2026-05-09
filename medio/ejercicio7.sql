select 
H.nationality as Nationality,
count(distinct U.unit_id) as aparment_count
from 
airbnb_hosts H
inner join airbnb_units U on H.host_id = U.host_id
where H.age < 30
and U.unit_type = 'Apartment'
group by H.nationality
order by count(distinct U.unit_id) desc