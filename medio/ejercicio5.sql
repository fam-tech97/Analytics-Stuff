with transactions as(
    select
        user_id,
        cast(created_at as date) as fecha,
        lag(cast(created_at as date)) OVER (PARTITION BY user_id order by created_at) as fecha_previa
    from amazon_transactions
)

select distinct user_id
from transactions
where datediff(day, fecha, fecha_previa) < 0 and datediff(day, fecha, fecha_previa) >= -7