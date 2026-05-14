with ranking as (
    select
        salary,
        dense_rank() over (order by salary desc) as rango
    from employee
)

select salary from ranking where rango = 2