with shipable as (
    select
        O.id as OrderId
    from orders O
    inner join customers C on O.cust_id = C.id
    where C.address is not null and C.address <> ''
)

select 
100 * count(S.OrderId) / cast(count(O.id) as decimal) as percent_shipable
from Orders O
left join shipable S on S.OrderId = O.id