CREATE database Pizza;

use Pizza;

select * from pizzas;
select * from pizza_types;
select * from orders;
select * from order_details;

/*Retrieve the total number of orders placed*/
SELECT COUNT(order_id) AS total_orders
FROM orders;

/*Calculate the total revenue generated from pizza sales*/
SELECT SUM(od.quantity * p.price) AS total_sales
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id;

/*Identify the highest-priced pizza*/
SELECT pt.name, p.price
FROM pizzas p
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;


/*Identify the most common pizza size ordered*/
SELECT p.size,
COUNT(od.order_details_id) AS size_ordered
FROM pizzas p
JOIN order_details od ON p.pizza_id = od.pizza_id
GROUP BY p.size
ORDER BY size_ordered DESC;

/*Calculate the percentage contribution of each pizza type to total revenue*/
SELECT pt.category,
ROUND(SUM(od.quantity * p.price) * 100 /
      (SELECT SUM(od.quantity * p.price)
       FROM order_details od
       JOIN pizzas p ON od.pizza_id = p.pizza_id), 2)
       AS contribution_percentage
FROM pizzas p
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
JOIN order_details od ON od.pizza_id = p.pizza_id
GROUP BY pt.category;

/*Analyze the cumalative revenue generated over time*/
SELECT date,
SUM(revenue) OVER (ORDER BY date) AS cum_revenue
FROM (
    SELECT o.date,
           SUM(od.quantity * p.price) AS revenue
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    JOIN pizzas p ON od.pizza_id = p.pizza_id
    GROUP BY o.date
) t;

/*Determine the distribution of orders by hour of the day*/
SELECT HOUR(time) AS hour,
COUNT(order_id) AS order_count
FROM orders
GROUP BY HOUR(time)
ORDER BY hour;


/*Join relevant tables to find the 
category-wise distribution of pizza*/
SELECT category,
COUNT(name) AS pizza_count
FROM pizza_types
GROUP BY category;

/*Group the orders by date and 
calculate average number of pizzas ordered per day*/
SELECT AVG(daily_total) AS average_per_day
FROM (
    SELECT o.date,
           SUM(od.quantity) AS daily_total
    FROM orders o
    JOIN order_details od
        ON o.order_id = od.order_details_id
    GROUP BY o.date
) t;


/*List the top 5 most ordered pizza types along with their quantities*/
SELECT pt.name, SUM(od.quantity) AS total_quantity FROM pizza_types pt
JOIN pizzas p 
     ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details od ON p.pizza_id = od.pizza_id
GROUP BY pt.name
ORDER BY total_quantity DESC LIMIT 5;


/*Join the necessary tables to find the total quantity 
of each pizza category ordered*/
SELECT pt.category,
SUM(od.quantity) AS total_quantity
FROM pizza_types pt
JOIN pizzas p 
     ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details od 
     ON p.pizza_id = od.pizza_id
GROUP BY pt.category
ORDER BY total_quantity DESC;