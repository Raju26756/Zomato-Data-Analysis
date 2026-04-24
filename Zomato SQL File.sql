--- 1. Total Resturants
select count(RestaurantID) as Total_Resturants from main;

---- 2.No.of Resturants based on city & coutry 
select c.CountryName ,
count(m.RestaurantID) as Count_of_Resturants from main m
join Country c on
m.CountryID=c.CountryID
group by c.CountryName
order by Count_of_Resturants desc;

SELECT 
c.CountryName,
m.City,
COUNT(m.RestaurantID) AS Count_of_Restaurants
FROM Main m
JOIN Country c
ON m.CountryID = c.CountryID
GROUP BY c.CountryName, m.City
ORDER BY Count_of_Restaurants DESC;

--- 3. No.Of.Restuarants opening by Year,Quarter,Month

select c.Year, count(m.RestaurantID) as Number_of_Restuarants_Opening
from calender1 c
join main m
on c.Date=m.Date
group by c.Year
order by Number_of_Restuarants_Opening desc;

SELECT 
c.Year,
c.Quarter,
c.MonthName,
COUNT(m.RestaurantID) AS Number_of_Restaurants
FROM Calender1 c
LEFT JOIN Main m
ON c.Date = m.Date
GROUP BY c.Year, c.Quarter, c.MonthNo, c.MonthName
ORDER BY c.Year, c.MonthNo;

---- 4.Count of Resturants based on Average Ratings by country

select round(avg(Rating),2) as avg_rating from main;

SELECT 
c.Countryname,
COUNT(m.RestaurantID) AS No_of_Restaurants,
ROUND(AVG(m.Rating),2) AS Avg_Ratings
FROM Main m
JOIN Country c
ON c.CountryID = m.CountryID
GROUP BY c.Countryname
ORDER BY Avg_Ratings DESC;

---- 5. Create buckets based on Average Price of reasonable size and find out how many resturants falls in each buckets

select
case
when Average_Cost_for_two<= 500 then '0-500'
when Average_Cost_for_two <= 1000 then '501-1000'
when Average_Cost_for_two<= 2000 then '1001-2000'
when Average_Cost_for_two <= 3000 then '2001-3000'
else '3000+'
end as Price_Bucket,
count(RestaurantID) as No_Of_Restuarants
from main
group by Price_Bucket
order by No_Of_Restuarants desc;

---- 6. Percentage of Resturants based on "Has_Table_booking"
select  Has_Table_booking,count(RestaurantID) as No_of_Restuarant,
concat(round(count(RestaurantID)*100/(select count(*)from main),2),"%") as Percentage from main
group by Has_Table_booking;

--- 7. Percentage of Resturants based on "Has_Online_delivery"
select Has_Online_delivery, count(RestaurantID) as No_of_Restuarant,
concat(round(count(RestaurantID)*100/(select count(*) from main),2),"%") as Percentage from main
group by Has_Online_delivery;

--- 8. Percentage of Resturants based on "DayType"
SELECT 
c.DayType,
COUNT(m.RestaurantID) AS No_of_Restaurants,
concat(ROUND(COUNT(m.RestaurantID)*100.0/(SELECT COUNT(*) FROM Main),2),"%") AS Percentage
FROM Main m
JOIN Calender1 c
ON m.Date = c.Date
GROUP BY c.DayType
ORDER BY No_of_Restaurants DESC;
--- 9. Top 10 cusines 
SELECT 
    City,
    Cuisines, 
    COUNT(RestaurantID) AS Total_Restaurants
FROM main
GROUP BY City, Cuisines
ORDER BY Total_Restaurants DESC
LIMIT 10;


 





