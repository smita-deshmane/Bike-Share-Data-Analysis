/* Merging all 12 csv files into one table using Union All. Choosing the columns that only needed for the analysis and excluding the remaining columns.
     Also creating additional columns for seperating date, time and hour from started date and ended date columns. Also, created seperate columns for 
   MonthNum, Month, Weekday for storing month_num, Month and weekday*/
USE bike_share

SELECT Cast(ride_id AS NVARCHAR(20))       AS ride_id,
       Cast(rideable_type AS NVARCHAR(10)) AS rideable_type,
       Cast(member_casual AS NVARCHAR(10)) AS membership_type,
       Cast(started_at AS DATE)            AS started_date,
       Cast(started_at AS TIME)            AS started_time,
       Cast(ended_at AS DATE)              AS ended_date,
       Cast(ended_at AS TIME)              AS ended_time,
       Datepart(hh, started_at)            AS started_hour,
       Datepart(hh, ended_at)              AS ended_hour,
       Datepart(month, started_at)         AS MonthNum,
       Format(started_at, 'MMM')           AS Month,
       Format(started_at, 'ddd')           AS Weekday
INTO   bike_data
FROM   (SELECT*
        FROM   [bike_share].[dbo].[202201-divvy-tripdata]
        UNION ALL
        SELECT *
        FROM   [bike_share].[dbo].[202202-divvy-tripdata]
        UNION ALL
        SELECT *
        FROM   [bike_share].[dbo].[202203-divvy-tripdata]
        UNION ALL
        SELECT *
        FROM   [bike_share].[dbo].[202204-divvy-tripdata]
        UNION ALL
        SELECT *
        FROM   [bike_share].[dbo].[202205-divvy-tripdata]
        UNION ALL
        SELECT *
        FROM   [bike_share].[dbo].[202206-divvy-tripdata]
        UNION ALL
        SELECT *
        FROM   [bike_share].[dbo].[202207-divvy-tripdata]
        UNION ALL
        SELECT *
        FROM   [bike_share].[dbo].[202208-divvy-tripdata]
        UNION ALL
        SELECT *
        FROM   [bike_share].[dbo].[202209-divvy-publictripdata]
        UNION ALL
        SELECT *
        FROM   [bike_share].[dbo].[202210-divvy-tripdata]
        UNION ALL
        SELECT *
        FROM   [bike_share].[dbo].[202211-divvy-tripdata]
        UNION ALL
        SELECT *
        FROM   [bike_share].[dbo].[202212-divvy-tripdata]) a

--Checking the values in the table bike_data--
SELECT TOP 1000*
FROM   bike_data

--DATA CLEANING--
--Checking for NULL values--
SELECT *
FROM   bike_data
WHERE  ride_id IS NULL
        OR rideable_type IS NULL
        OR membership_type IS NULL

-- Checking for duplicate--
SELECT ride_id, Count(*) AS no_of_rides
FROM   bike_data
GROUP  BY ride_id
HAVING Count(*) > 1

--Checking distinct rideable_type--
SELECT DISTINCT( rideable_type )
FROM   bike_data

--Checking distinct membership_type--
SELECT DISTINCT( membership_type )
FROM   bike_data

--DATA MANIPULATION--
--Creating a column Trip_Duration for calculating the ride length--
ALTER TABLE bike_data
  ADD [trip_duration] AS Datediff (minute, started_time, ended_time) persisted

--Checking the min and max and avg of ride duration--
SELECT Min(trip_duration) AS min_trip_duration,
       Max(trip_duration) AS max_trip_duration,
       Avg(trip_duration) AS avg_trip_duration
FROM   bike_data

-- Removing rows with trip duration less than one minutes
SELECT *
FROM   bike_data
WHERE  trip_duration < 1

DELETE FROM bike_data
WHERE  trip_duration < 1

--Creating a column named Season for getting the season based on MonthNum--
ALTER TABLE bike_data
  ADD season VARCHAR(10)

--Updating the column Season using MonthNum--
UPDATE bike_data
SET    season = CASE
                  WHEN monthnum >= 3
                       AND monthnum <= 5 THEN 'Spring'
                  WHEN monthnum >= 6
                       AND monthnum <= 8 THEN 'Summer'
                  WHEN monthnum >= 9
                       AND monthnum <= 11 THEN 'Fall'
                  ELSE 'Winter'
                END

--DATA ANALYSIS--
--Checking the busiest day of the week--
SELECT weekday,
       Count(ride_id) AS rides
FROM   bike_data
GROUP  BY weekday
ORDER  BY rides DESC

--Checking busiest time of the day--
SELECT started_hour,
       Count(started_date) AS rides
FROM   bike_data
GROUP  BY started_date
ORDER  BY rides DESC

--Checking the busiest Season--
SELECT season,
       Count(ride_id) AS rides
FROM   bike_data
GROUP  BY season
ORDER  BY rides DESC

--Count of rides as per membership type--
SELECT membership_type,
       Count(ride_id) AS rides
FROM   bike_data
GROUP  BY membership_type

--Average ride duration per membership type--
SELECT membership_type,
       Avg(trip_duration) AS avg_trip_duration
FROM   bike_data
GROUP  BY membership_type

-- Rideable type as per membership type--
SELECT rideable_type,
       membership_type,
       Count(ride_id) rides
FROM   bike_data
GROUP  BY rideable_type,
          membership_type
ORDER  BY rides DESC

--Number of rides taken during the week as per membership type--
SELECT membership_type,
       weekday,
       Count(ride_id) AS rides
FROM   bike_data
GROUP  BY membership_type,
          weekday
ORDER  BY membership_type,
          rides DESC

--Number of rides taken during specific month of the year as per membership type--
SELECT membership_type,
       month,
       Count(ride_id) AS rides
FROM   bike_data
GROUP  BY membership_type,
          month
ORDER  BY membership_type,
          rides DESC

--Number of rides taken during specific time of the day as per membership type--
SELECT membership_type,
       started_hour,
       Count(ride_id) AS rides
FROM   bike_data
GROUP  BY membership_type,
          started_hour
ORDER  BY membership_type,
          rides DESC

--Number of rides taken during specific season of the year as per membership type--
SELECT membership_type,
       season,
       Count(ride_id) AS rides
FROM   bike_data
GROUP  BY membership_type,
          season
ORDER  BY membership_type,
          rides DESC

--Average ride duration during the specific day of the week as per membership type--
SELECT membership_type,
       weekday,
       Avg(trip_duration) AS avg_trip_duration
FROM   bike_data
GROUP  BY membership_type,
          weekday
ORDER  BY membership_type,
          avg_trip_duration DESC 
