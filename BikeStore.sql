-- This code generates a data set with direct and indirect joins with fields consisting of
-- the order ID, customer's firsta dn last name, customer's city and state, the order date,
-- sales volume, revenue, product name, product category, brand name, store name and sales representative.

-- ***The mission is to review the condition of sales activities within the company and gain insight to the various trends happening in the sales volume from 2016 to 2018 period.


Select ord.order_id,
CONCAT(cus.first_name,' ',cus.last_name) AS 'Customers',
cus.city,
cus.state,
ord.order_date,
SUM(ite.quantity) AS 'Total_Units',
SUM(ite.quantity * ite.list_price) AS 'Revenue',
pro.product_name,
cat.category_name,
sto.store_name,
CONCAT(sta.first_name,' ',sta.last_name) AS 'Sales_Rep'
From sales.orders ord
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products pro
ON ite.product_id =pro.product_id
JOIN production.categories cat
ON pro.category_id =cat.category_id
JOIN sales.stores sto
ON ord.store_id = sto.store_id
JOIN sales.staffs sta
ON ord.staff_id = sta.staff_id
GROUP BY
ord.order_id,
CONCAT(cus.first_name,' ',cus.last_name),
cus.city,
cus.state,
ord.order_date,
pro.product_name,
cat.category_name,
sto.store_name,
CONCAT(sta.first_name,' ',sta.last_name)