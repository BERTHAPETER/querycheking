-- Selecting Data
SELECT * FROM customers;
SELECT * FROM dishes;
SELECT * FROM orders;

SELECT d.Dish_id, d.Dish_Name, o.Order_id, o.Price, o.Date_Time
FROM dishes d
JOIN dishes_orders do ON d.Dish_id = do.Dish_id
JOIN orders o ON do.Order_id = o.Order_id;

SELECT c.Customer_id, c.First_Name, c.Last_Name, o.Order_id, o.Price, o.Date_Time
FROM customers c
JOIN orders o ON c.Customer_id = o.Customer_id;

-- Inserting Data
INSERT INTO customers (First_Name, Last_Name, Address, Email, Birthday)
VALUES ('Jane', 'Doe', '1234 Elm St', 'jane.doe@example.com', '1990-01-01');

INSERT INTO dishes (Customer_id, Dish_Name, Dish_Description, Quantity)
VALUES (1, 'Pasta Alfredo', 'Creamy Alfredo pasta', 2);

INSERT INTO orders (Customer_id, Price)
VALUES (1, 2500);

INSERT INTO dishes_orders (Dish_id, Order_id)
VALUES (1, 1);

-- Updating Data
UPDATE customers
SET Email = 'new.email@example.com'
WHERE Customer_id = 1;

UPDATE dishes
SET Dish_Description = 'Updated description'
WHERE Dish_id = 1;

UPDATE orders
SET Price = 3000
WHERE Order_id = 1;

-- Deleting Data
DELETE FROM customers
WHERE Customer_id = 1;

DELETE FROM dishes
WHERE Dish_id = 1;

DELETE FROM orders
WHERE Order_id = 1;

DELETE FROM dishes_orders
WHERE Dish_order_id = 1;

-- Advanced Queries
SELECT Customer_id, COUNT(Order_id) AS NumberOfOrders
FROM orders
GROUP BY Customer_id;

SELECT Customer_id, SUM(Price) AS TotalSpent
FROM orders
GROUP BY Customer_id;

SELECT Customer_id, COUNT(Order_id) AS NumberOfOrders
FROM orders
GROUP BY Customer_id
HAVING COUNT(Order_id) > 5;

SELECT d.Dish_Name, COUNT(do.Dish_id) AS OrderCount
FROM dishes d
JOIN dishes_orders do ON d.Dish_id = do.Dish_id
GROUP BY d.Dish_id
ORDER BY OrderCount DESC
LIMIT 1;
