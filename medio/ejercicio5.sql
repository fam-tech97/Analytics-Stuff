with previous_dates as (
    select
        user_id,
        cast(created_at as date) as primera_fecha,
        lag(cast(created_at as date)) over (partition by user_id order by cast(created_at as date)) as fecha_previa
    from amazon_transactions
    where revenue > 0
)

select distinct
    user_id
from previous_dates
where datediff(day, primera_fecha, fecha_previa) < 0 and datediff(day, primera_fecha, fecha_previa) >= -7