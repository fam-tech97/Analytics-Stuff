-- Necesito encontrar aquellos clientes que hayan tenido al menos 1 pedido de mas de 100$.
-- Primero necesito hacer una agrupación de número de pedidos y la cantidad de cada pedido.
-- Hay que tener en cuenta los pedidos que se hayan pagado. (status = paid)
select distinct
OC.customer_id as customer_id,
OC.customer_name as customer_name
from
online_store_orders OO
inner join online_store_customers OC on OC.customer_id = OO.customer_id and OO.amount > 100