
-- ==========================================
-- Track performance over time cumulatively.
-- ==========================================

-- total sales per month.
-- cumulative of total sales over time.
select 
order_date,
total_sales,
sum(total_sales) over (order by order_date) as cumulative_total_sales
from (
select 
datetrunc (month, purchase_ts_clean) as order_date,
sum(usd_price) as total_sales
from gamezoneClean
where purchase_ts_clean is not null
group by datetrunc (month, purchase_ts_clean)
) t


-- total sales per month.
-- cumulative of total sales over time that resets every year.
select 
order_date,
total_sales,
sum(total_sales) over (partition by year(order_date) order by order_date) as yearly_total_sales
from (
select 
datetrunc (month, purchase_ts_clean) as order_date,
sum(usd_price) as total_sales
from gamezoneClean
where purchase_ts_clean is not null
group by datetrunc (month, purchase_ts_clean)
) t


-- total sales per year.
-- cumulative of total sales every year.
select 
order_date,
total_sales,
sum(total_sales) over (order by order_date) as yearly_total_sales
from (
select 
datetrunc (year, purchase_ts_clean) as order_date,
sum(usd_price) as total_sales
from gamezoneClean
where purchase_ts_clean is not null
group by datetrunc (year, purchase_ts_clean)
) t