use SQL_Project;

-- Triggers

-- Why? Triggers are used to automatically execute logic when data changes.

-- Example: Auto-update total amount in Orders when new item is added

DELIMITER //
create trigger updateTotalAmount
AFTER INSERT ON OrderItems
for each row

Begin
update orders
set total_amount = (
select sum(oi.quantity*p.price)
from orderitems oi
join product p on p.product_id = oi.product_id
 WHERE oi.order_id = NEW.order_id
)
where order_id = NEW.order_id

;end //



DELIMITER ;

SELECT * FROM Orders WHERE order_id = 5001;

INSERT INTO OrderItems (item_id, order_id, product_id, quantity)
VALUES (51, 5001, 102, 2);

SELECT * FROM Orders WHERE order_id = 5001;