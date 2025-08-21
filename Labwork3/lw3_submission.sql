USE northwind;
-- câu 1
SELECT *
FROM orders
WHERE order_date > '2006-03-24';

-- câu 2
SELECT product_id, 
unit_price, 
quantity,
unit_price * quantity * (1 - discount) AS 'value of order'
FROM order_details
WHERE order_id = 31;

-- câu 3
SELECT order_id,
order_date, 
company
FROM orders
LEFT JOIN customers 
ON orders.customer_id = customers.id
LEFT JOIN order_details OD
ON OD.order_id = orders.id;


-- câu 4
SELECT order_id,
order_date, 
company
FROM orders
LEFT JOIN employees 
ON orders.employee_id = employees.id
LEFT JOIN order_details OD
ON OD.order_id = orders.id
HAVING order_date > '2006-03-24';

-- câu 5
SELECT order_id,
order_date, 
company
FROM orders
LEFT JOIN employees 
ON orders.employee_id = employees.id
LEFT JOIN order_details OD
ON OD.order_id = orders.id
HAVING order_date > '2006-03-24'
AND sub_total >= 800;

-- câu 6
SELECT e.id,
CONCAT(first_name," ", last_name) full_name,
SUM(unit_price * quantity) sales
FROM employees e
LEFT JOIN orders o
ON o.employee_id = e.id
LEFT JOIN order_details od
ON od.order_id = o.id
GROUP BY e.id
ORDER BY SUM(unit_price * quantity) DESC;

-- câu 7
SELECT company,
CONCAT(first_name," ", last_name) full_name,
customers.email_address,
LEFT(company, 1) AS "Role"
FROM customers
UNION 
SELECT company,
CONCAT(first_name," ", last_name) full_name,
suppliers.email_address,
LEFT(company, 1) AS "Role"
FROM suppliers;

-- câu 8
SELECT DISTINCT category
FROM products
ORDER BY category;

-- câu 9
SELECT MAX(standard_cost) max_cost,
MIN(standard_cost) min_cos,
avg(standard_cost) average_cost,
std(standard_cost) standard_devi,
variance(standard_cost) variance
FROM products;

-- câu 10

SELECT category,
avg(list_price) average_price
FROM products
GROUP BY category;

-- câu 11
SELECT category,
avg(list_price) average_price
FROM products
GROUP BY category
ORDER BY avg(list_price) DESC
LIMIT 10;

-- câu 12
WITH average_price AS (SELECT category,
avg(list_price) average_price
FROM products
GROUP BY category)

SELECT products.category,
MIN(average_price) min_average_price
FROM products
LEFT JOIN average_price ap
ON ap.category = products.category;

-- câu 13
WITH approve AS (
SELECT approved_by, 
CONCAT(e.first_name," ", e.last_name) approved_full_name
FROM purchase_orders po
LEFT JOIN employees e
ON po.approved_by = e.id)


SELECT po.id,
CONCAT(e.first_name," ", e.last_name) created_full_name,
approved_full_name

FROM purchase_orders po
LEFT JOIN employees e
ON e.id = po.created_by
JOIN approve
ON approve.approved_by = po.approved_by


