select 
type,
round(1.0 * sum(case when processed = 'TRUE' then 1 else 0 end)/ count(*), 2) as processed_rate
from facebook_complaints
group by type