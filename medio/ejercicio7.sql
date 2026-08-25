select
--nationality from hosts
H.nationality as nationality,
count(distinct U.unit_id) as apartment_count
--units from units
from airbnb_hosts H
inner join airbnb_units U on H.host_id = U.host_id
where H.age < 30 and U.unit_type = 'Apartment'
group by H.nationality
order by apartment_count desc