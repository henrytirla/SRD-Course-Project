USE retail_chains;

# 6. Create view to recreate the information on the INVOICE, one view for the head and totals.
DROP VIEW IF EXISTS vw_invoice_details;
CREATE VIEW vw_invoice_details
    AS
    SELECT orders.id AS invoiceId, product.name AS ProductName, order_product.unit_price AS unitCost, order_product.quantity AS QTY, order_product.amount AS AMOUNT
    FROM orders
        JOIN order_products order_product ON order_product.order_id = orders.id
        JOIN store_products store_product ON store_product.id = order_product.store_product_id
        JOIN product ON store_product.product_id = product.id;

#7. Create view to recreate the information on the INVOICE, one view for the details.
DROP VIEW IF EXISTS vw_invoice_summary;
CREATE VIEW vw_invoice_summary
    AS
    SELECT orders.id AS invoiceId, orders.code AS invoiceNumber, orders.time AS dateOfIssue, transaction.sub_total AS subTotal,
           transaction.discount AS Discount, transaction.tax_rate AS taxRate, transaction.tax AS Tax, transaction.total AS Total,
           concat(customer.first_name, ' ', customer.last_name) AS clientName, customer.address AS clientAddress,
           store.store_name AS storeName, location.city AS storeCity, location.street_address AS storeAddress, location.postal_code AS storePostalCode,
           concat(employee.first_name, ' ', employee.last_name) AS employeeName, employee.email AS employeeEmail, job.title AS employeeJobtitle
    FROM orders
        JOIN transaction ON transaction.order_id = orders.id
        JOIN store ON store.id = orders.store_id
        JOIN location ON location.id = store.location_id
        JOIN customer ON customer.id = orders.customer_id
        JOIN employee ON employee.id = orders.employee_id
        JOIN job ON job.id = employee.job_id;
