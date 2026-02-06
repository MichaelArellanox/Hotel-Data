USE Projects1;

with hotel_data as (
select * from dbo.[2018rev]
union
select * from dbo.[2019rev]
union
select * from dbo.[2020rev])

select * from hotel_data as hd
left join dbo.market_segment as ms
on hd.market_segment = ms.market_segment
left join dbo.meal_cost as mc
on mc.meal = hd.meal

