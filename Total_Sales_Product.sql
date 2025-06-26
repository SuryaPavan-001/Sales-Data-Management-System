use SQL_Project;

-- Total sales per product:

select p.name , sum(oi.quantity*price) as total_sales
from orderitems oi
join Product p on oi.product_id = p.product_id
group by p.name 
order by p.name