/*
===========================
Basic KPI / Measure Summary
===========================
*/

select
  -- Total Sales (USD)
  sum(usd_price) as total_sales,

  -- Total Items Sold (each row = 1 item)
  count(*) as total_items_sold,

  -- Average Selling Price per Item
  round(avg(usd_price), 2) as avg_selling_price,

  -- Total Number of Orders
  count(distinct order_id) as total_orders,

  -- Total Number of Unique Products
  count(distinct product_name_clean) as total_products,

  -- Total Number of Unique Customers
  count(distinct user_id) as total_customers

from gamezoneClean
where usd_price is not null and usd_price <> 0;
