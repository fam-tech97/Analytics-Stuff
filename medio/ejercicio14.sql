select 
value as category,
sum(review_count) as reviews
from yelp_business
CROSS APPLY string_split(categories,';')
group by value
order by reviews desc;