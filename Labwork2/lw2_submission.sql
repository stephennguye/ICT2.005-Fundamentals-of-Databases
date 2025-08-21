-- 1. Write a query to get discontinued Product list (Product ID and name).
SELECT id AS ProductID, product_name AS ProductName
FROM Products
WHERE discontinued = 1;

-- 2. Retrieve the top 4 cheapest products.
SELECT id AS ProductID, product_name AS ProductName, list_price
FROM Products
ORDER BY list_price ASC
LIMIT 4;

-- 3. Write a query to get Product list (id, name, list_price) whose list_price cost between $15 and $25.
SELECT id AS ProductID, product_name AS ProductName, list_price
FROM Products
WHERE list_price BETWEEN 15 AND 25;

-- 4. List employees with two columns: id, full_name which is constructed from first_name and last_name.
SELECT id AS id, CONCAT(first_name, ' ', last_name) AS full_name
FROM Employees;

-- 5. Find employees whose names start with ‘A’.
SELECT id, first_name, last_name
FROM Employees
WHERE first_name LIKE 'A%';

-- 6. Show how many different cities the employees are living in.
SELECT COUNT(DISTINCT City) AS DifferentCities
FROM Employees;

-- 7. Show ship_name of table Orders without duplicated values.
SELECT DISTINCT ShipName
FROM Orders;

-- 8. Show the minimum and maximum of list price in Products table.
SELECT MIN(list_price) AS MinPrice, MAX(list_price) AS MaxPrice
FROM Products;

-- 9. Display the number of current (Discontinued = 0) products.
SELECT COUNT(*) AS CurrentProducts
FROM Products
WHERE discontinued = 0;

-- 10. Show the average and standard deviation of the list_price of products.
SELECT AVG(list_price) AS AvgPrice, STDDEV(list_price) AS PriceStdDev
FROM Products;

-- 11. Use subquery, show Product list (name, list_price) more expensive than the average price.
SELECT product_name AS ProductName, list_price
FROM Products
WHERE list_price > (SELECT AVG(list_price) FROM Products);

-- 12. Insert a new row to table Suppliers with the following values: 
-- company = ‘Habeco’, last_name = ‘Nguyễn’, first_name = ‘Hồng Linh’, city = ‘Hanoi’, country_region = ‘Vietnam’
INSERT INTO Suppliers (company, last_name, first_name, city, country_region)
VALUES ('Habeco', 'Nguyễn', 'Hồng Linh', 'Hanoi', 'Vietnam');


-- 13. Insert a new product into table products with the following values:
-- product_code = ‘TBTruc Bach’, SupplierID = the value corresponding to ‘Habeco’, list_price = 22, discontinued = 0, category = ‘Beverages’
INSERT INTO Products (product_code, supplier_ids, product_name, list_price, discontinued, category)
VALUES ('TBTruc Bach', 
        (SELECT id FROM Suppliers WHERE company = 'Habeco'), 
        'Truc Bach', 22, 0, 'Beverages');


-- 14. Modify the information of ‘Truc Bach’: set standard_cost = 18.
SET SQL_SAFE_UPDATES = 0;
UPDATE Products
SET standard_cost = 18
WHERE product_name = 'Truc Bach';
SET SQL_SAFE_UPDATES = 1;

-- 15. Try deleting the row which was just inserted in table Suppliers.
DELETE FROM Suppliers
WHERE company = 'Habeco' AND last_name = 'Nguyễn' AND first_name = 'Hồng Linh';
