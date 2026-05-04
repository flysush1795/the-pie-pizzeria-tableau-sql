create database pizza_db;
use pizza_db;
select * from pizza_sales;
desc pizza_sales;

alter table pizza_sales
modify column order_date date;

-- Since the format of the date is DD-MM-YYYY in the data, the above SQL alter query is not able to convert the datatype in the date format as SQL needs 
-- YYYY-MM-DD format str_to_date function

update pizza_sales
set order_date = str_to_date(order_date, '%d-%m-%Y');

-- Disabling safe mode, otherwise we won't be able to update and delete things without where clause
SET SQL_SAFE_UPDATES = 0; 

alter table pizza_sales
modify column order_time time;

alter table pizza_sales 
modify column pizza_name_id varchar(50);

alter table pizza_sales
modify column pizza_size varchar (10);

alter table pizza_sales
modify column pizza_category varchar(50);

alter table pizza_sales
modify column pizza_ingredients nvarchar(100);

alter table pizza_sales
modify column pizza_name varchar(50);

-- Total Revenue: The Sum of the total prices of all pizza orders.alter
select round(sum(total_price), 2) as Total_price from pizza_sales;

-- Average Order value
select round(sum(total_price) / count(distinct order_id),2) Average_order_value from pizza_sales;

-- Total Pizza Sold
select sum(quantity) Total_Pizza_Sold from pizza_sales;

-- Total Orders
select count(distinct order_id) Total_orders from pizza_sales;

-- Average Pizza per Order
select round(sum(quantity) / count(distinct order_id),2) as Avg_pizza_per_order from pizza_sales;

-- Hourly Trend For Total Pizza Sales
select hour(order_time) Store_hours, sum(quantity) Total_Sales from pizza_sales
group by hour(order_time)
order by hour(order_time);

-- Weekly Trend for Total Orders
select week(order_date, 3) Week_of_the_year, year(order_date) 'Year',count(distinct order_id) Total_orders from pizza_sales
group by week(order_date, 3), year(order_date)
order by week(order_date, 3), year(order_date);

-- Percentage of Sales by Pizza Category
select pizza_category, concat(round((sum(total_price) / (select sum(total_price) from pizza_sales)) * 100, 2), " %") as Percentage_sales
from pizza_sales
group by pizza_category;

-- Percentage of sales by Pizza Size
select pizza_size, concat(round((sum(total_price) / (select sum(total_price) from pizza_sales)) * 100, 2), " %") as Percentage_sales 
from pizza_sales
group by pizza_size;

-- Top 5 best sellers by Revenue, Total Qunatity and Total Orders
select pizza_name, sum(total_price) Revenue
from pizza_sales
group by pizza_name
order by revenue asc limit 5;










