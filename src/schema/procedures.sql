USE retail_chains;

# `TR_supply_process_AINSERT` A Trigger run after inserting a new supply into `supply_process` to
# 1. Update target store products' quantity.
# 2. Or insert new row if its first supply of that product.
# 3. log changes on all affected tabled.
DROP TRIGGER IF EXISTS `TR_supply_process_AINSERT`;
DELIMITER $$
CREATE TRIGGER `TR_supply_process_AINSERT` AFTER INSERT ON `supply_process` FOR EACH ROW BEGIN
    DECLARE rowsCount INT DEFAULT 0;
    DECLARE price_ INT DEFAULT 0;
    SELECT COUNT(*) INTO rowsCount FROM store_products where store_products.store_id = NEW.store_id AND store_products.product_id = NEW.product_id;
    IF rowsCount > 0 THEN
        UPDATE store_products SET quantity = quantity + NEW.quantity where store_products.store_id = NEW.store_id AND store_products.product_id = NEW.product_id;
        INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('store_products', 'UPDATE', concat('store_id=', NEW.store_id,', product_id=', NEW.product_id), concat('quantity updated to: +', NEW.quantity));
    ELSE
        SELECT price INTO price_ from product where product.id = NEW.product_id;
        INSERT INTO store_products(`store_id`, `product_id`, `price`, `quantity`, `created_at`, `updated_at`) VALUES (NEW.store_id, NEW.product_id, price_, NEW.quantity, NOW(), NOW());
        INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('store_products', 'INSERT', concat('store_id=', NEW.store_id,', product_id=', NEW.product_id), concat('New product been added with quantity=', NEW.quantity));
    END IF;
    INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('supply_process', 'INSERT', concat('supplier_id=', NEW.supplier_id,', store_id=', NEW.store_id, ', product_id=', NEW.product_id), concat('New product been added with quantity=', NEW.quantity));
END
$$
DELIMITER ;

# `TR_orders_BINSERT` A Trigger run before inserting new order to
# 1. log changes on all affected tabled.
DROP TRIGGER IF EXISTS `TR_orders_BINSERT`;
DELIMITER $$
CREATE TRIGGER `TR_orders_BINSERT` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
    IF NOT (NEW.code) THEN
            SET NEW.code = LPAD(FLOOR(RAND() * 999999.99), 13, '0');
    END IF;
    INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('orders', 'INSERT', concat('customer_id=', NEW.customer_id,', store_id=', NEW.store_id), 'New Order Been Added');
END
$$
DELIMITER ;

# `TR_order_products_BINSERT` A Trigger run before inserting a new product to order to
# 1. Checks on product quantity in stock - if still in stock and can cover asked quantity then.
# 2. Calculate total price.
# 3. Or return error msg if not enough items.
# 4. log changes on all affected tabled.
DROP TRIGGER IF EXISTS `TR_order_products_BINSERT`;
DELIMITER $$
CREATE TRIGGER `TR_order_products_BINSERT` BEFORE INSERT ON `order_products` FOR EACH ROW BEGIN
    DECLARE storeID INT DEFAULT 0;
    DECLARE pQuantity INT DEFAULT 0;
    DECLARE pPrice INT DEFAULT 0;
    SELECT `orders`.store_id INTO storeID FROM `orders` WHERE `orders`.id = NEW.order_id;
    IF storeID > 0 THEN
        SELECT store_products.quantity, store_products.price INTO pQuantity, pPrice
                     FROM store_products WHERE store_products.id= NEW.store_product_id;
        IF pQuantity > NEW.quantity THEN
            SET NEW.unit_price = pPrice;
            SET NEW.amount = pPrice * NEW.quantity;
        ELSE
            SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT = 'Store Dose not have This Product / Product Out Of Stock / Requested Quantity Exceeded';
        END IF;
    ELSE
        SIGNAL SQLSTATE '40001'
        SET MESSAGE_TEXT = 'Invalid Store ID / Check Order ID If Exists';
    END IF;
END
$$
DELIMITER ;

# `TR_order_products_AINSERT` A Trigger run after inserting a new product to order to
# 1. Update order status to `InProgress`
# 2. Keep order amount updated with each product added.
# 3. Update store product quantity in the stock.
# 4. log changes on all affected tabled.
DROP TRIGGER IF EXISTS `TR_order_products_AINSERT`;
DELIMITER $$
CREATE TRIGGER `TR_order_products_AINSERT` AFTER INSERT ON `order_products` FOR EACH ROW BEGIN
    DECLARE storeID INT DEFAULT 0;
    SELECT orders.store_id INTO storeID FROM orders WHERE orders.id = NEW.order_id;
    IF storeID > 0 THEN
        UPDATE orders SET status = 'InProgress', amount = amount + NEW.amount, updated_at = NOW() WHERE orders.id = NEW.order_id;
        INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('orders', 'UPDATE', concat('order_id=', NEW.order_id), concat('status updated to: ', 'InProgress'));
        UPDATE store_products SET quantity = quantity - NEW.quantity WHERE product_id = NEW.store_product_id;
        INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('store_products', 'UPDATE', concat('product_id=', NEW.store_product_id), concat('quantity updated to: -', NEW.quantity));
    ELSE
        SIGNAL SQLSTATE '40001'
        SET MESSAGE_TEXT = 'Invalid Store ID / Check Order ID If Exists';
    END IF;
    INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('order_products', 'INSERT', concat('order_id=', NEW.order_id,', product_id=', NEW.store_product_id), 'New Order Product Been Added');
END
$$
DELIMITER ;

# `TR_orders_AUPDATE` A Trigger run After updating order to
# 1. Check if order status set to `Done` Then
# 2. Insert a new transaction for that order with all required data.
# 3. Set transaction subTotal, Tax, etc ..
# 4. log changes on all affected tabled.
DROP TRIGGER IF EXISTS `TR_orders_AUPDATE`;
DELIMITER $$
CREATE TRIGGER `TR_orders_AUPDATE` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
    DECLARE tTotal INT DEFAULT 0;
    DECLARE tDiscount INT DEFAULT 0;
    DECLARE tTaxRate INT DEFAULT 5;
    DECLARE tTax INT DEFAULT 0;
    IF NEW.status IN ('Done') THEN
        SET tTax = (tTaxRate/100) * OLD.amount;
        SET tTotal = OLD.amount + tTax;
        SET tDiscount = 0;
        INSERT INTO transaction (
         customer_id, store_id, order_id, sub_total, total,
         discount,tax_rate, tax, date_of_purchase, payment_method,
         employee_id) VALUES
              (OLD.customer_id, OLD.store_id, OLD.id, OLD.amount, tTotal,
              tDiscount, tTaxRate, tTax, OLD.time, OLD.payment_method, OLD.employee_id);
        INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('transaction', 'INSERT', concat('order_id=', OLD.id,', customer_id=', OLD.customer_id, ', store_id=', OLD.store_id), 'New Transaction Been Added');
        INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('orders', 'UPDATE', concat('order_id=', OLD.id), concat('status updated to: ', 'Done'));
    END IF;
END
$$
DELIMITER ;

# `TR_product_rate_AINSERT` A Trigger run after customer insert a new product rate to
# 1. Update the average of product rate.
# 2. log changes on all affected tabled.
DROP TRIGGER IF EXISTS `TR_product_rate_AINSERT`;
DELIMITER $$
CREATE TRIGGER `TR_product_rate_AINSERT` AFTER INSERT ON `product_rate` FOR EACH ROW BEGIN
    DECLARE totalCount INT DEFAULT 0;
    DECLARE totalSum DECIMAL DEFAULT 0;
    SELECT count(*), SUM(rate) INTO totalCount, totalSum FROM product_rate WHERE product_id = NEW.product_id AND store_id = NEW.store_id;
    UPDATE store_products SET rate = (totalSum/totalCount) WHERE store_id=NEW.store_id AND product_id = NEW.product_id;
    INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('product_rate', 'INSERT', concat('storeId=',NEW.store_id, ', product_id=', NEW.product_id,', customer_id=', NEW.customer_id), 'New Product rate Been Added');
    INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('store_products', 'UPDATE', concat('storeId=',NEW.store_id, ', product_id=', NEW.product_id), concat('rate updated to: ', (totalSum/totalCount)));
END
$$
DELIMITER ;

# `GET_AvgSales` A Stored Procedure to
# 1. return total sales, yearly and monthly average of given store & period time
DROP PROCEDURE IF EXISTS `GET_AvgSales`;
DELIMITER $$
CREATE PROCEDURE `GET_AvgSales`(IN storeId int, IN fromYear int, IN toYear int)
BEGIN
        SELECT CONCAT(fromYear, '-', toYear) as PeriodOfSales, SUM(yearlySales.TotalSales) as TotalSales,
               floor(avg(yearlySales.TotalSales)) as avgYearlySales,
               floor(avg(monthlySales.TotalSales)) as avgMonthlySales
        FROM
        (
            SELECT SUM(amount) AS TotalSales
            FROM orders o WHERE store_id = storeId AND YEAR(time) BETWEEN fromYear AND toYear
            GROUP BY store_id, YEAR(time)
        ) as yearlySales,
        (
            SELECT SUM(amount) AS TotalSales
            FROM orders WHERE store_id = storeId AND YEAR(time) BETWEEN fromYear AND toYear
            GROUP BY store_id, YEAR(time), MONTH(time)
        ) as monthlySales;
    END$$
DELIMITER ;