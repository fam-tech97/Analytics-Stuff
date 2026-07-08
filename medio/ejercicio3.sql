with clean_data as (
    select distinct
        user_id,
        cast(created_at as DATE) as purchase_date
    from amazon_transactions
    where revenue > 0
),

ranking_data as (
    select
        user_id,
        purchase_date,
        RANK() OVER(partition by user_id order by purchase_date) as ranking
    from clean_data
),

onlytwo as (
    select
        user_id,
        max(case when ranking = 1 then purchase_date end) as purchase_date,
        max(case when ranking = 2 then purchase_date end) as purchase_date2
    from ranking_data
    where ranking between 1 and 2
    group by user_id
)

select
user_id
from onlytwo
where datediff(day, purchase_date, purchase_date2) between 1 and 7