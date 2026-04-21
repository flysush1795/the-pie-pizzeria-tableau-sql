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

```sql
select round(sum(total_price) / count(distinct order_id),2) Average_order_value
from pizza_sales;
```

### 3. Total Pizzas Sold: The sum of the quantities of the pizza sold.

```sql
select sum(quantity) Total_Pizza_Sold
from pizza_sales;
```

### 4. Average Pizzas per Order: The average number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total number of orders.

```sql
select round(sum(quantity) / count(distinct order_id),2) as Avg_pizza_per_order
from pizza_sales;
```

### 5. Total Orders: The total numbers of orders placed.

```sql
select count(distinct order_id) Total_orders
from pizza_sales;
```

## Charts Requirnment

We would visualize various aspects of our pizza sales data to gain insights and understand key trends. Following are the business requirnments for creating charts:

### 1. Hourly Trend for Total Pizzas Sold: Created an stacked bar chart that displays the hourly trend of total orders over a specific time period. This charts will help ud identify any patterns or fluctutations in order volumes on a hourly basis.

```sql
select hour(order_time) Store_hours, sum(quantity) Total_Sales
from pizza_sales
group by hour(order_time)
order by hour(order_time);
```

### 2. Weekly Trend for Total Orders: Created a line chart that illustrate the weekly trend of total orders throughout the year. This chart will help us identify the peak weaks or periods of high order activity.

```sql
select week(order_date, 3) Week_of_the_year, year(order_date) 'Year' ,count(distinct order_id) Total_orders
from pizza_sales
group by week(order_date, 3), year(order_date)
order by week(order_date, 3), year(order_date);
```

### 3. Percentage of Sales by Pizza Category: Created a pie chart that shows the distribution of the sales across different pizza categories. This chart will provide insights in the popularity of various pizza categories and their contribution to overall sales.

```sql
select pizza_category, concat(round((sum(total_price) / (select sum(total_price) from pizza_sales)) * 100, 2), " %") as Percentage_sales
from pizza_sales
group by pizza_category;
```


