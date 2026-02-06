USE Projects1;

with hotel_data as (
select * from dbo.[2018rev]
union
select * from dbo.[2019rev]
union
select * from dbo.[2020rev])
  
select arrival_date_year, hotel, sum((stays_in_week_nights + stays_in_weekend_nights) * adr) as revenue,
concat (round((sum(required_car_parking_spaces) / sum(stays_in_week_nights + stays_in_weekend_nights)) * 100, 2), '%') as parking_percentage
from hotel_data
group by arrival_date_year, hotel

select * from hotel_data as hd
left join dbo.market_segment as ms
on hd.market_segment = ms.market_segment
left join dbo.meal_cost as mc
on mc.meal = hd.meal





