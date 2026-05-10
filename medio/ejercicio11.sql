select distinct
h.host_id as host_id,
g.guest_id as guest_id
from airbnb_hosts H
inner join airbnb_guests G on H.nationality = G.nationality
and H.gender = G.gender