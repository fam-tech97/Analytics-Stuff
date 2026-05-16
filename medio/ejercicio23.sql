select
w1.worker_id,
w1.first_name,
w1.salary
from worker w1
inner join worker w2 on w1.salary = w2.salary and w1.worker_id <> w2.worker_id