use SQL_Project;

--  Stored Procedures
-- Why? Stored procedures allow you to save reusable logic inside the database.

-- Example: Get total sales for a product by name


DELIMITER //
create Procedure GetProductTotalSales (in productname varchar(100))
Begin 
select p.name , sum(oi.quantity*price) as total_sales
from orderitems oi 
join product p on p.product_id = oi.product_id
where p.name  = productname
group by p.name;

end // 

DELIMITER ;

-- DROP PROCEDURE IF EXISTS GetProductTotalSales;


CALL GetProductTotalSales('Laptop');