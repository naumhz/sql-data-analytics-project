
/*
======================
Dimensions Exploration
======================

 - Explore the structure of dimension tables.

*/

-- List of unique countries of the customer
select distinct
country_code
from gamezoneClean
where country_code is not null


-- List of unique products sold
select distinct
product_name_clean as product_name
from gamezoneClean

-- List of unique purchase platforms
select distinct
PURCHASE_PLATFORM
from gamezoneClean

-- List of unique marketing channels
select distinct
MARKETING_CHANNEL_CLEAN as marketing_channel
from gamezoneClean
where MARKETING_CHANNEL_CLEAN is not null and MARKETING_CHANNEL_CLEAN <> 'unknown'

-- List of unique account creation method
select distinct
ACCOUNT_CREATION_METHOD_CLEAN as creation_method
from gamezoneClean
where ACCOUNT_CREATION_METHOD_CLEAN is not null and ACCOUNT_CREATION_METHOD_CLEAN <> 'unknown'

-- List of unique region
select distinct region
from gamezoneClean
where region IS NOT NULL and region <> '#N/A'
