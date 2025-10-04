# Pizza-sales----SQL
This project analyzes pizza sales data for a restaurant using SQL. A relational database was designed with tables for orders, order_details, pizzas, and pizza_types. The goal is to extract business insights such as revenue trends, top-selling pizzas, order distribution, and category-wise performance.

Analyzed pizza sales data by designing a relational database and writing SQL queries to calculate total revenue, identify top-selling pizzas, track order trends, and summarize category-wise sales. Extracted actionable insights using joins, aggregations, and groupings.


Tables & Relationships

1.orders

  order_id (PK)

  order_date

  order_time

2.order_details

  order_details_id (PK)

  order_id (FK → orders.order_id)

  pizza_id (FK → pizzas.pizza_id)

  quantity

3.pizza_types

  pizza_type_id (PK)

  name

  category

  ingredients

4.pizzas

  pizza_id (PK)

  pizza_type_id (FK → pizza_types.pizza_type_id)

  size

  price











  
