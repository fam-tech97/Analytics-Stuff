with data as (
    select
    inspection_id,
    inspection_type,
    max(case 
        when risk_category = 'Low Risk' then 1
        when risk_category = 'Moderate Risk' then 2
        when risk_category = 'High Risk' then 3
        else 0
    end) as cases
    from sf_restaurant_health_violations
    group by inspection_id, inspection_type
)


select
inspection_type,
count(case when cases = 0 then 1 end) as no_risk_results,
count(case when cases = 1 then 1 end) as low_risk_results,
count(case when cases = 2 then 1 end) as medium_risk_results,
count(case when cases = 3 then 1 end) as high_risk_results,
count(*) as total_inspections
from data
group by inspection_type