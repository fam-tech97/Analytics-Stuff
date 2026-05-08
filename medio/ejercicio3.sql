with clean_data as (
    select distinct
        user_id,
        cast(created_at as date) as fecha
    from amazon_transactions
),

ranking as (
    select
        user_id,
        fecha,
        RANK() OVER (PARTITION BY user_id order by fecha) as rango
    from clean_data
),

dos_primeros as(
    select
        user_id,
        max(case when rango = 1 then fecha end) as primera_fecha,
        max(case when rango = 2 then fecha end) as segunda_fecha
    from ranking
    where rango <= 2
    group by user_id
)

select user_id from dos_primeros
where segunda_fecha is not null and datediff(day, primera_fecha, segunda_fecha) between 1 and 7
order by user_id;