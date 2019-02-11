--Page 54

select user_id
, case when register_device = 1 then 'desktop'
       when register_device = 2 then 'smartphone'
       when register_device = 3 then 'application'
  end as device_name
from "053_mst_users";

--Page 56

select stamp
  , substring(referrer  from 'https?://([^/]*)') AS referrer_host
from "056_access_log";
 --Hive select stamp
 --Hive ,parse_url(referrer, 'HOST') AS referrer_host
 --Hive from `056_access_log`;


--Page 57

select stamp
  , url
  , substring(url  from '//[^/]+([^?#]+)') AS path
  , substring(url  from 'id=([^&]*)') AS id
from "056_access_log";
 --Hive select stamp
 --Hive   , url
 --Hive ,parse_url(url, 'PATH') AS path
 --Hive ,parse_url(url, 'QUERT', 'id') AS id
 --Hive from `056_access_log`;


--Page 58

select
    stamp
  , url
  , split_part(substring(url  from '//[^/]+([^?#]+)'),'/',2) AS path1
  , split_part(substring(url  from '//[^/]+([^?#]+)'),'/',3) AS path2
from "056_access_log";
 --Hive select
 --Hive     stamp
 --Hive   , url
 --Hive   ,split(parse_url(url, 'PATH'),'/')[0] AS path0
 --Hive   ,split(parse_url(url, 'PATH'),'/')[1] AS path1
 --Hive   ,split(parse_url(url, 'PATH'),'/')[2] AS path2
 --Hive from `056_access_log`;

--Page 58
select
    current_date AS dt
  , current_timestamp AS stamp;
 --Hive ,  current_date() AS dt
 --Hive , current_timestamp() AS stamp



--Page 61
select
  CAST('2016-01-30' AS date ) AS dt
  , CAST('2016-01-30 12:00:00' AS timestamp) as STAMP;
--Hive  date('2016-01-30') AS dt
--Hive , timestamp('2016-01-30 12:00:00') AS stamp


--Page 62
select
   STAMP
  , extract(YEAR from STAMP) AS Year
  , extract(MONTH from STAMP) AS Month
  , extract(DAY from STAMP) AS Day
  , extract(Hours from STAMP) AS Hour

--Hive , YEAR ( STAMP) AS Year
--Hive , MONTH ( STAMP) AS Month
--Hive , DAY ( STAMP) AS Day
--Hive , Hours ( STAMP) AS Hour
from (select CAST('2016-01-30 12:00:00' AS timestamp) as STAMP ) AS t1;


--Page63
select
   STAMP
  , substring(STAMP,1,4) AS Year
  , substring(STAMP,6,2) AS Month
  , substring(STAMP,9,2) AS Day
  , substring(STAMP,12,2) AS Hour
  , substring(STAMP,1,7) AS Year_month
--Hive  , substr(STAMP,1,4) AS Year
--Hive , substr(STAMP,6,2) AS Month
--Hive , substr(STAMP,9,2) AS Day
--Hive , substr(STAMP,12,2) AS Hour
--Hive , substr(STAMP,1,7) AS Year_month
from (select CAST('2016-01-30 12:00:00' AS text) as STAMP ) AS t2
--Hive from (select CAST('2016-01-30 12:00:00' AS string) as STAMP ) AS t2
;
  --Page64
Select
  purchase_id
  , amount
  , coupon
  , amount - coupon AS discount_amount1
  , amount - coalesce(coupon,0) AS discount_amount2
from "064_purchase_log_with_coupon";
