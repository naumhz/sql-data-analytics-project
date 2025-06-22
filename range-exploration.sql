/*
===========================
Data Range Exploration
===========================

- Explore date and numeric column ranges.
*/

-- Purchase date range
select 
  min(purchase_ts_clean) as first_purchase,
  max(purchase_ts_clean) as last_purchase
from gamezoneClean
where purchase_ts_clean IS NOT NULL;

-- Shipping date range
select 
  min(ship_ts) as first_ship,
  max(ship_ts) as last_ship
from gamezoneClean
where ship_ts IS NOT NULL;

-- Time to ship (in days) range 
select 
  min(time_to_ship) AS min_days_to_ship,
  max(time_to_ship) AS max_days_to_ship
from gamezoneClean
where time_to_ship is not null
  and purchase_ts_clean <= ship_ts
