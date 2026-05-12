with data as (
    select name, 
        review_count,
        rank() over (order by review_count desc) as ranking
    from yelp_business
)

select name, review_count from data where ranking <= 5