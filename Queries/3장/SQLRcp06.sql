--Page 67

select
  user_id
  , CONCAT(pref_name,city_name) AS pref_city
from "067_mst_user_location" ;

--Page 69

select
  year
  , q1
  , q2
    -- Q1과 Q2의 매출 변화 평가하기
  , Case
      when q1 < q2 then '+'
      when q1 = q2 then ' '
      else '-'
    end AS judge_q1_q2
     -- Q1 과 Q2의 매출액 차이 계산하기
  , q2 - q1 AS diff_q2_q1
    -- Q1과 Q2의 매출 변화를 1,0,-1로 표현하기
  , sign(q2 - q1) AS sign_q2_q1
FROM "069_quarterly_sales"
order by year;

--Page 70

select
  year
     -- Q1~Q4의 최대 매출 구하기
  , greatest(q1,q2,q3,q4) as greated_sales
     -- Q1~Q4의 최소 매출 구하기
  , least(q1,q2,q3,q4) as least_sales
FROM "069_quarterly_sales"
order by year;


--Page 71

select
  year
     -- Q1~Q4의 평균 매출 구하기
  , (q1+q2+q3+q4)/4 as average_sales
FROM "069_quarterly_sales"
order by year;


--Page 72.1
select
  year
     -- Q1~Q4의 평균 매출 구하기
  , (coalesce(q1,0)+coalesce(q2,0)+coalesce(q3,0)+coalesce(q4,0))/4 as average_sales
FROM "069_quarterly_sales"
order by year;



--Page 72.2
select
  year
     -- Q1~Q4의 평균 매출 구하기
  , (coalesce(q1,0)+coalesce(q2,0)+coalesce(q3,0)+coalesce(q4,0))
   / (sign(coalesce(q1,0))+sign(coalesce(q2,0))+sign(coalesce(q3,0))+sign(coalesce(q1,0)))
     as average_sales
FROM "069_quarterly_sales"
order by year;



--Page 74
select
  dt
  , ad_id
  ,clicks
    --   정수를 나눌때 자동적으로 실수로 변환
  , cast(clicks as double precision)/impressions as ctr
  , 100.00*cast(clicks as double precision)/impressions as ctr_as_percent
 --Hive , clicks/impressions as ctr
 --Hive , 100.0 * clicks / impressions as ctr_as_percent
from "074_advertising_stats"
where dt='2017-04-01'
order by dt, ad_id;

--Page 76
select
  dt
  , ad_id
     -- case 로 분모가 0일 경우 분기해서 0으로 나누지 않게 만드는 방법
  ,case
    when impressions > 0 then  100.00*cast(clicks as double precision)/impressions
   end  as ctr_as_percent

  -- 분모가 0 이라면 널로 변환해서 0으로 나누지 않게 만드는 방법
  , 100.00*cast(clicks as double precision)/nullif(impressions,0) AS ctr_as_percent_by_null

 --Hive , 100.0 * clicks / case  when impressions = 0 then NULL else impressions end as ctr_as_percent
from "074_advertising_stats"
where dt='2017-04-01'
order by dt, ad_id;

  --Page77
Select
  purchase_id
  , amount
  , coupon
  , amount - coupon AS discount_amount1
  , amount - coalesce(coupon,0) AS discount_amount2
from "077_location_1d"
