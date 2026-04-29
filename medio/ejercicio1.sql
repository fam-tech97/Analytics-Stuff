with page_loads as (
    select
        user_id,
        cast(timestamp as date) as fecha,
        max(timestamp) as page_load
    from facebook_web_log
    where action = 'page_load'
    group by user_id, cast(timestamp as date)
),

page_exits as (
    select
        user_id,
        cast(timestamp as date) as fecha,
        min(timestamp) as page_exit
    from facebook_web_log
    where action = 'page_exit'
    group by user_id, cast(timestamp as date)
),

clear_data as (
    select 
        l.user_id,
        l.fecha,
        datediff(second, l.page_load, e.page_exit) as difference
    from page_exits E
    inner join page_loads L on L.user_id = E.user_id and L.fecha = E.fecha
    where L.page_load < E.page_exit
)

select 
user_id,
avg(difference * 1.0) as avg_session_duration
from clear_data
group by user_id
