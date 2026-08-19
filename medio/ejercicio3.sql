with clean_data as (
    select distinct
        user_id,
        cast(created_at as date) as fecha
    from amazon_transactions
    where revenue > 0
),

ranking as (
    select
        user_id,
        fecha,
        rank() over (partition by user_id order by fecha) as ranking
    from clean_data
),

user_dates as (
    select
        user_id,
        max(case when ranking = 1 then fecha end) as primera_fecha,
        max(case when ranking = 2 then fecha end) as segunda_fecha
    from ranking
    group by user_id
)

select distinct
user_id
from user_dates
where datediff(day, primera_fecha, segunda_fecha) between 1 and 7