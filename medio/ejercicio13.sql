with max_cool_votes as (
    select
        max(cool) as cool_votes
    from yelp_reviews
)

select
Y.business_name as Business_name,
Y.review_text as Review_text
from yelp_reviews Y
inner join max_cool_votes V on Y.cool = V.cool_votes