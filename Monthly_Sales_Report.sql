-- Monthly sales report:
use SQL_Project;

select date_format(order_date, '%y-%m') as month, sum(total_amount) as total
from orders
group by month
order by month