
--=====================
-- Products Performance
--=====================


with yearly_product_sales as (
SELECT 
  year (purchase_ts_clean) as order_year,
  product_name_clean as product_name,
  sum(usd_price) as sales
FROM gamezoneClean
WHERE purchase_ts_clean IS NOT NULL 
  AND usd_price <> 0
  group by year (purchase_ts_clean), PRODUCT_NAME_CLEAN
  )

 select 
 order_year,
 product_name,
 sales,

 -- average & comparison
 avg(sales) over (partition by product_name) avg_sales,
 sales - avg(sales)  over (partition by product_name) diff_avg,
 case when  sales - avg(sales)  over (partition by product_name) > 0 then 'Above Avg'
     when  sales - avg(sales)  over (partition by product_name) < 0 then 'Below Avg'
	 else 'Avg' end avg_status,	

-- previous year sales & comparison

	 lag(sales) over (partition by product_name order by order_year) as pre_sales,
	 sales - lag(sales) over (partition by product_name order by order_year) as pre_diff,
	  case when   sales - lag(sales) over (partition by product_name order by order_year) > 0 then 'Increase'
     when sales - lag(sales) over (partition by product_name order by order_year) < 0 then 'Decrease'
	 else 'No Change' end pre_status
 from yearly_product_sales
 order by product_name, order_year

