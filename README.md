# 🍕 The Pie Pizzeria — Sales Dashboard & SQL Analysis

## Project Overview

This project showcases an end-to-end data analysis of The Pie Pizzeria, where raw sales data is transformed into actionable business insights using SQL and Tableau. The primary goal is to analyze key performance indicators (KPIs) and present them through an interactive and visually intuitive dashboard.

## KPIs Requuirnment
We need to analyize the key indicators for pizza sales data to gain insight into the business performance. Specifically, following metrics needs to be calculated:

### 1. Total Revenue: The sum of the total price of all pizza orders.

```sql
select round(sum(total_price), 2) as Total_price
from pizza_sales;
```
