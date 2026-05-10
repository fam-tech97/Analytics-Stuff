select 
100.0 * sum(
    Case when c.address is not null or c.address <> '' then 1 else 0 end
)/ count(distinct o.id)  as percent_shipable
from orders O
left join customers C on O.cust_id = C.id