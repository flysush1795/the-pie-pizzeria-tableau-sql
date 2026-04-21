# 🍕 The Pie Pizzeria — Sales Dashboard & SQL Analysis

## Project Overview

This project showcases an end-to-end data analysis of The Pie Pizzeria, where raw sales data is transformed into actionable business insights using SQL and Tableau. The primary goal is to analyze key performance indicators (KPIs) and present them through an interactive and visually intuitive dashboard.

## KPIs Requirnment

We need to analyize the key indicators for pizza sales data to gain insight into the business performance. Specifically, following metrics needs to be calculated:

### 1. Total Revenue: The sum of the total price of all pizza orders.

```sql
select round(sum(total_price), 2) as Total_price
from pizza_sales;
```

### 2. Average Order Value: The average amount spent per order, calculted by dividing the total revenue by the total number of orders.

```
select round(sum(total_price) / count(distinct order_id),2) Average_order_value
from pizza_sales;
```

### 3. Total Pizzas Sold: The sum of the quantities of the pizza sold.

```
select sum(quantity) Total_Pizza_Sold
from pizza_sales;
```

### 4. Average Pizzas per Order: The average number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total number of orders.

```
select round(sum(quantity) / count(distinct order_id),2) as Avg_pizza_per_order
from pizza_sales;
```

### 5. Total Orders: The total numbers of orders placed.

```
select count(distinct order_id) Total_orders
from pizza_sales;
```

## Charts Requirnment


