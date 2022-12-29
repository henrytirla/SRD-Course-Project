/**
  1. List all the customer’s names, dates, and products bought by these customers in a range of two dates.

| id | select\_type | table | partitions | type | possible\_keys | key | key\_len | ref | rows | filtered | Extra |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | SIMPLE | order\_product | null | ALL | PRIMARY,order\_id\_index,store\_product\_id\_index | null | null | null | 3398 | 100 | Using temporary; Using filesort |
| 1 | SIMPLE | customer | null | eq\_ref | PRIMARY | PRIMARY | 4 | retail\_chains.order\_product.order\_id | 1 | 100 | null |
| 1 | SIMPLE | store\_product | null | eq\_ref | PRIMARY,product\_id\_index | PRIMARY | 4 | retail\_chains.order\_product.store\_product\_id | 1 | 100 | null |
| 1 | SIMPLE | product | null | eq\_ref | PRIMARY | PRIMARY | 4 | retail\_chains.store\_product.product\_id | 1 | 100 | null |
| 1 | SIMPLE | orders | null | eq\_ref | PRIMARY,time\_index,store\_id\_index | PRIMARY | 4 | retail\_chains.order\_product.order\_id | 1 | 66.13 | Using where |
| 1 | SIMPLE | store | null | eq\_ref | PRIMARY | PRIMARY | 4 | retail\_chains.orders.store\_id | 1 | 100 | null |

*/
SELECT
    CONCAT(customer.first_name, ' ', customer.last_name) AS FullName,
    orders.time AS OrderTime,
    store.store_name AS StoreName,
    product.name AS ProductName,
    order_product.quantity AS ProductQuantity,
    order_product.unit_price AS ProductPrice
FROM `orders`
    JOIN customer ON customer.id = orders.id
    JOIN store ON store.id = orders.store_id
    JOIN order_products order_product ON  order_product.order_id = orders.id
    JOIN store_products store_product ON store_product.id = order_product.store_product_id
    JOIN product ON product.id = store_product.product_id
WHERE orders.time BETWEEN '2021-01-01' AND NOW() ORDER BY customer_id;

/**
  2.1. List the best three stores (Best Sales stores)

| id | select\_type | table | partitions | type | possible\_keys | key | key\_len | ref | rows | filtered | Extra |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | SIMPLE | store | null | ALL | PRIMARY | null | null | null | 13 | 100 | Using temporary; Using filesort |
| 1 | SIMPLE | orders | null | ref | store\_id\_index | store\_id\_index | 4 | retail\_chains.store.id | 115 | 100 | null |

*/
SELECT store.store_name AS StoreName, count(*) AS TotalOrders, SUM(amount) AS TotalSales
FROM orders
    JOIN store ON orders.store_id = store.id
GROUP BY store_id ORDER BY TotalSales DESC , TotalOrders DESC LIMIT 3;

/**
  2.2. List the best three products (Most selling product across all stores).

| id | select\_type | table | partitions | type | possible\_keys | key | key\_len | ref | rows | filtered | Extra |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | SIMPLE | order\_product | null | ALL | store\_product\_id\_index | null | null | null | 3398 | 100 | Using temporary; Using filesort |
| 1 | SIMPLE | store\_product | null | eq\_ref | PRIMARY,product\_id\_index | PRIMARY | 4 | retail\_chains.order\_product.store\_product\_id | 1 | 100 | null |
| 1 | SIMPLE | product | null | eq\_ref | PRIMARY,category\_id\_index,supplier\_id\_index | PRIMARY | 4 | retail\_chains.store\_product.product\_id | 1 | 100 | null |

 */
SELECT product.name AS ProductName, SUM(order_product.quantity) TotalSoldQuantity
FROM order_products order_product
    JOIN store_products store_product ON order_product.store_product_id = store_product.id
    JOIN product ON store_product.product_id = product.id
GROUP BY product.id
ORDER BY TotalSoldQuantity desc LIMIT 3;

/**
  3. Get the average amount of sales for a period that involves 2 or more years.

| id | select\_type | table | partitions | type | possible\_keys | key | key\_len | ref | rows | filtered | Extra |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | PRIMARY | &lt;derived2&gt; | null | ALL | null | null | null | null | 116 | 100 | null |
| 1 | PRIMARY | &lt;derived3&gt; | null | ALL | null | null | null | null | 116 | 100 | Using join buffer \(hash join\) |
| 3 | DERIVED | orders | null | ref | fk\_order\_store\_id | fk\_order\_store\_id | 4 | const | 116 | 100 | Using index condition; Using where; Using temporary |
| 2 | DERIVED | o | null | ref | fk\_order\_store\_id | fk\_order\_store\_id | 4 | const | 116 | 100 | Using index condition; Using where; Using temporary |

 */
CALL GET_AvgSales(5, 2021, 2022);

/**
  4. Get the total sales/bookings/rents/deliveries by geographical location (city/country).

| id | select\_type | table | partitions | type | possible\_keys | key | key\_len | ref | rows | filtered | Extra |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | SIMPLE | store | null | ALL | PRIMARY,location\_id\_index | null | null | null | 13 | 100 | Using where; Using temporary |
| 1 | SIMPLE | location | null | eq\_ref | PRIMARY,country\_id\_index | PRIMARY | 4 | retail\_chains.store.location\_id | 1 | 100 | null |
| 1 | SIMPLE | country | null | eq\_ref | PRIMARY | PRIMARY | 4 | retail\_chains.location.country\_id | 1 | 100 | null |
| 1 | SIMPLE | orders | null | ref | store\_id\_index | store\_id\_index | 4 | retail\_chains.store.id | 115 | 100 | null |

 */
SELECT country.name AS CountryName, location.city AS cityName, store.store_name AS StoreName, SUM(amount) AS TotalSales
FROM orders
    JOIN store ON orders.store_id = store.id
    JOIN location ON store.location_id = location.id
    JOIN country ON country.id = location.country_id
GROUP BY country.id, location.city, store.id;

/**
  5. List all the locations where products/services were sold, and the product has customer’s ratings.

| id | select\_type | table | partitions | type | possible\_keys | key | key\_len | ref | rows | filtered | Extra |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | SIMPLE | order\_product | null | index | PRIMARY,order\_id\_index,store\_product\_id\_index | order\_id\_index | 4 | null | 3398 | 100 | Using index; Using temporary; Using filesort |
| 1 | SIMPLE | store\_product | null | eq\_ref | PRIMARY,product\_id\_index | PRIMARY | 4 | retail\_chains.order\_product.store\_product\_id | 1 | 100 | null |
| 1 | SIMPLE | product | null | eq\_ref | PRIMARY | PRIMARY | 4 | retail\_chains.store\_product.product\_id | 1 | 100 | null |
| 1 | SIMPLE | orders | null | eq\_ref | PRIMARY,store\_id\_index | PRIMARY | 4 | retail\_chains.order\_product.order\_id | 1 | 100 | null |
| 1 | SIMPLE | store | null | eq\_ref | PRIMARY,location\_id\_index | PRIMARY | 4 | retail\_chains.orders.store\_id | 1 | 100 | Using where |
| 1 | SIMPLE | location | null | eq\_ref | PRIMARY | PRIMARY | 4 | retail\_chains.store.location\_id | 1 | 100 | null |

 */
SELECT location.city AS City, store.store_name AS StoreName, product.name AS productName, store_product.rate AS avgRate
FROM orders
    JOIN order_products order_product ON orders.id = order_product.order_id
    JOIN store_products store_product ON store_product.id = order_product.store_product_id
    JOIN product ON product.id = store_product.product_id
    JOIN store ON store.id = orders.store_id
    JOIN location ON store.location_id = location.id
GROUP BY location.city, product.id, store.id, avgRate
ORDER BY avgRate desc ;

/**
  6.1. Create view to recreate the information on the INVOICE, one view for the head and totals.

| id | select\_type | table | partitions | type | possible\_keys | key | key\_len | ref | rows | filtered | Extra |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | SIMPLE | orders | null | const | PRIMARY | PRIMARY | 4 | const | 1 | 100 | Using index |
| 1 | SIMPLE | order\_product | null | ref | PRIMARY,order\_id\_index,store\_product\_id\_index | PRIMARY | 4 | const | 9 | 100 | null |
| 1 | SIMPLE | store\_product | null | eq\_ref | PRIMARY,product\_id\_index | PRIMARY | 4 | retail\_chains.order\_product.store\_product\_id | 1 | 100 | null |
| 1 | SIMPLE | product | null | eq\_ref | PRIMARY | PRIMARY | 4 | retail\_chains.store\_product.product\_id | 1 | 100 | null |

 */
SELECT * FROM vw_invoice_details WHERE invoiceId = 452;

/**
  6.2. Create view to recreate the information on the INVOICE, one view for the details.

| id | select\_type | table | partitions | type | possible\_keys | key | key\_len | ref | rows | filtered | Extra |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | SIMPLE | orders | null | const | PRIMARY,customer\_id\_index,store\_id\_index,employee\_id\_index | PRIMARY | 4 | const | 1 | 100 | null |
| 1 | SIMPLE | store | null | const | PRIMARY,location\_id\_index | PRIMARY | 4 | const | 1 | 100 | null |
| 1 | SIMPLE | location | null | const | PRIMARY | PRIMARY | 4 | const | 1 | 100 | null |
| 1 | SIMPLE | customer | null | const | PRIMARY | PRIMARY | 4 | const | 1 | 100 | null |
| 1 | SIMPLE | employee | null | const | PRIMARY,job\_id\_index | PRIMARY | 4 | const | 1 | 100 | null |
| 1 | SIMPLE | job | null | const | PRIMARY | PRIMARY | 4 | const | 1 | 100 | null |
| 1 | SIMPLE | transaction | null | ref | order\_id\_index | order\_id\_index | 4 | const | 1 | 100 | null |

 */
SELECT * FROM vw_invoice_summary WHERE invoiceId = 452;


/**
     # Insert Queries Samples,,

    INSERT INTO `supply_process` (supplier_id, product_id, store_id,date,quantity) VALUES(1,1,1, NOW(),1938);

    INSERT INTO `orders` (customer_id, store_id, code, time, description, payment_method, type, employee_id) VALUES(1,1,'5248424813683',NOW(),'Beatae culpa amet quia quae.','Cash','Store',1);

    INSERT IGNORE INTO `order_products` (order_id, store_product_id, quantity, unit_price) VALUES(1,1,7,167.21);

    UPDATE orders set status = 'Done' WHERE TRUE;

    INSERT INTO `product_rate` (`customer_id`,`product_id`,`store_id`,`rate`) VALUES(1,1,4,4.6);
 */
