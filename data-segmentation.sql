
--
-- Data Segmentation
--	

-- Order Segmentation by Price Range
WITH product_segment as(
select
  order_id,
  PRODUCT_NAME_CLEAN,
  USD_PRICE,
  case when USD_PRICE <	100 then 'Below 100'
  when USD_PRICE between 100 and 1000 then '100 - 1000'
  when USD_PRICE between 1000 and 5000 then '1000 - 5000'
  else 'Above 5000' end price_range
  from gamezoneClean
  WHERE usd_price <> 0)

  select
  price_range,
  count (order_id) as total_orders
  from product_segment
  group by price_range


  -- Customer Segmentation by Spending Behaviour
  WITH spending_segment as(
  select
  user_id,
  sum (USD_PRICE) as total_spending,
  max(purchase_ts_clean) as first_order,
  min(purchase_ts_clean) as last_order,
  datediff(month, min(purchase_ts_clean),  max(purchase_ts_clean)) as lifespan
  from gamezoneClean
    WHERE usd_price <> 0
	and PURCHASE_TS_CLEAN is not null
	group by user_id
	)

	select
	customer_segment,
	count(user_id) as total_customers
	from(
	select
	user_id,
	case when lifespan >= 12 and total_spending > 5000 then 'Loyal'
	when lifespan > 12 and total_spending <= 5000 then 'Regular'
	else 'New' end customer_segment
  from spending_segment) t
  group by customer_segment
  order by total_customers




