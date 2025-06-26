-- Customers who bought more than 2 items:
use SQL_Project;

select c.name , sum(oi.quantity) as total_items
from customers c
join orders o on o.customer_id = c.customer_id
join orderitems oi on oi.order_id = o.order_id
group by c.name
having total_items>3;