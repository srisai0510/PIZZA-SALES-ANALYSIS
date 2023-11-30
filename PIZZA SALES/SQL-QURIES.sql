use pizza_db;

select * from pizza_sales;

-- GETTING REVENUE--

select sum(total_price) as Total_Revenue from pizza_sales;

-- AVERAGE ORDER VALUE --

select sum(total_price)/count(distinct order_id) as Average_Order_Value   from pizza_sales;

-- TOTAL PIZZAS SOLD --

select sum(quantity) as Total_Pizzas_Sold from pizza_sales;

-- TOTAL ORDERS PLACED --

select count(distinct order_id) as Total_Orders from pizza_sales;


-- AVERAGE PIZZAS PER ORDER --

select sum(quantity)/count(distinct order_id) As Average_Pizzas from pizza_sales; 

-- PERCENTAGE OF SALES BY PIZZA CATEGORY --

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

-- PERCENTAGE OF SALES BY PIZZA SIZE --

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales)
 AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
order by pct;

-- TOP 5 BEST SELLERS BY REVENUE, TOTAL QUANTITY and TOTAL ORDERS--

 select pizza_name, sum(total_price) as Total_Revenue from pizza_sales
 group by pizza_name
 order by Total_Revenue desc
 limit 5;
 
 select pizza_name, sum(Quantity) as Total_Quantity from pizza_sales
 group by pizza_name
 order by Total_Quantity desc
 limit 5;
 
 select pizza_name, sum(DISTINCT(order_id)) as Total_Orders from pizza_sales
 group by pizza_name
 order by Total_orders desc
 limit 5;
 
 -- BOTTOM 5 BEST SELLERS BY REVENUE, TOTAL QUANTITY and TOTAL ORDERS--
 
select pizza_name, sum(total_price) as Total_Revenue from pizza_sales
 group by pizza_name
 order by Total_Revenue 
 limit 5;
 
 select pizza_name, sum(Quantity) as Total_Quantity from pizza_sales
 group by pizza_name
 order by Total_Quantity 
 limit 5;
 
 select pizza_name, sum(DISTINCT(order_id)) as Total_Orders from pizza_sales
 group by pizza_name
 order by Total_orders 
 limit 5;
 