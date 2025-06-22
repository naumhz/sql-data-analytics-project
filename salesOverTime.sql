
-- ===================================================
-- Analyze sales performance over time.
-- Track growth, trends, and measure growth or decline.
-- ===================================================

-- Simple date function
select
year (purchase_ts_clean) as order_year,
month (purchase_ts_clean) as order_month,
sum(usd_price) as total_sales,
count(distinct user_id) as total_customer,
count(order_id) as total_orders
from gamezoneClean
where purchase_ts_clean is not null
group by year (purchase_ts_clean), month(purchase_ts_clean)
order by year (purchase_ts_clean), month(purchase_ts_clean)


--DATETRUNC Function
select
datetrunc (month, purchase_ts_clean) as order_date,
sum(usd_price) as total_sales,
count(distinct user_id) as total_customer,
count(order_id) as total_orders
from gamezoneClean
where purchase_ts_clean is not null
group by datetrunc (month, purchase_ts_clean)
order by datetrunc (month, purchase_ts_clean)



