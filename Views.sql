-- VIEWS

use SQL_Project;

-- Why Views? ANS ==> Views are used to simplify complex queries and provide a layer of security.

-- Example 1: Customer Order Summary View

Create view Customer_order_summary as
select c.customer_id, c.name, count(o.order_id) as total_orders, sum(o.total_amount) as spent
from orders o 
join customers c on c.customer_id = o.customer_id
group by c.customer_id,c.name
order by c.name;

select * from Customer_order_summary;

-- Now i want spent is more then 50000

select * from Customer_order_summary where spent>50000;

-- Now i want spent between 25000 and 75000

select * from Customer_order_summary where spent between 25000 and 75000;

-- now i want total orders more than 2 and spent between 25000 and 75000

select * from Customer_order_summary where (spent between 25000 and 50000) and (total_orders >= 1);
