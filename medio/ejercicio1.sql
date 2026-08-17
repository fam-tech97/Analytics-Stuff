with page_load as (
    select
        user_id,
        cast(timestamp as date) as dia,
        max(timestamp) as fecha
    from facebook_web_log
    where action = 'page_load'
    group by user_id, cast(timestamp as date)
),

page_exit as (
    select
        user_id,
        cast(timestamp as date) as dia,
        min(timestamp) as fecha
    from facebook_web_log
    where action = 'page_exit'
    group by user_id, cast(timestamp as date)
),

full_data as (
    select
        PL.user_id as user_id,
        datediff(second, PL.fecha, PE.fecha) as diferencia
    from page_load PL
    inner join page_exit PE on PL.user_id = PE.user_id and PL.dia = PE.dia
)

select
    user_id,
    avg(cast(diferencia as decimal)) as avg_session_duration
from full_data
group by user_id