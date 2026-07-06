--Crear una CTE tanto para page_loads como page_exits

with loads as (
    select
        user_id,
        cast(timestamp as DATE) as day,
        max(timestamp) as load_time
    from facebook_web_log
    where action = 'page_load'
    group by user_id, cast(timestamp as DATE)
),

exits as (
    select
        user_id,
        cast(timestamp as DATE) as day,
        min(timestamp) as exit_time
    from facebook_web_log
    where action = 'page_exit'
    group by user_id, cast(timestamp as DATE)
),
    
diff as (    
    select
        L.user_id as user_id,
        L.load_time as load_time,
        E.exit_time as exit_time,
        datediff(second, L.load_time, E.exit_time) as time_difference
    from loads L
    inner join exits E on E.user_id = L.user_id and E.day = L.day
    where L.load_time < E.exit_time
)

select
user_id,
avg(1.0 * time_difference) as avg_session_duration
from diff
group by user_id