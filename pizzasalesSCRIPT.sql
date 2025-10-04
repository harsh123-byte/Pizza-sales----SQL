CREATE DATABASE Pizzahut;
USE Pizzahut;

CREATE TABLE orders (
order_id int not null,
order_date date not null,
order_time time not null,
primary key(order_id) );

CREATE TABLE orders_details (
order_details_id int not null,
order_id int not null,
pizza_id text not null,
quantity int not null,
primary key(order_details_id) );




-- 1. Retrieve the total number of orders placed
SELECT COUNT(*) AS total_orders
FROM orders;

-- 2. Calculate the total revenue generated from pizza sales
SELECT SUM(od.quantity * p.price) AS total_revenue
FROM orders_details as od
JOIN pizzas as p
ON od.pizza_id = p.pizza_id;

-- 3. Identify the highest-priced pizza
SELECT pizza_id, price
FROM pizzas
ORDER BY price DESC
LIMIT 1;

-- 4. Identify the most common pizza size ordered
SELECT p.size, SUM(od.quantity) AS total_ordered
FROM orders_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY total_ordered DESC
LIMIT 1;

-- 5. List the top 5 most ordered pizza types along with their quantities
SELECT pt.name, SUM(od.quantity) AS total_quantity
FROM orders_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_quantity DESC
LIMIT 5;


-- 6. Find the total quantity of each pizza category ordered
SELECT pt.category, SUM(od.quantity) AS total_quantity
FROM orders_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY total_quantity DESC;

-- 7. Determine the distribution of orders by hour of the day
SELECT HOUR(order_time) AS order_hour, COUNT(order_id) AS total_orders
FROM orders
GROUP BY HOUR(order_time)
ORDER BY order_hour;

-- 8. Find the category-wise distribution of pizzas
SELECT pt.category, COUNT(p.pizza_id) AS total_pizzas
FROM pizzas p
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category;

-- 9. Group orders by date and calculate the average number of pizzas ordered per day
SELECT order_date, AVG(total_pizzas) AS avg_pizzas_per_day
FROM (
    SELECT o.order_date, SUM(od.quantity) AS total_pizzas
    FROM orders o
    JOIN orders_details od ON o.order_id = od.order_id
    GROUP BY o.order_date
) daily_orders
GROUP BY order_date;

-- 10. Determine the top 3 most ordered pizza types based on revenue
SELECT pt.name, SUM(od.quantity * p.price) AS total_revenue
FROM orders_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_revenue DESC
LIMIT 3;





