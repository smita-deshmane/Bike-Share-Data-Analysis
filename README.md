# Case study: How does a bike-share company navigate speedy success
Author: Smita Deshmane
### Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)
### Visualization
Tableau: [Cyclistic Dashboard](https://public.tableau.com/app/profile/smita.deshmane4857/viz/CyclisticBikeshareDataAnalysis_17055498717670/Bike-ShareAnalysis#1)
### Tools used in Analysis
* Data Cleaning: Microsoft Excel   
* Data Analysis: Microsft SQL Server   
* Visualization: Tableau Public

# Background
Cyclistic: A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can't use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.

Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members. Cyclistic's finance analysts have concluded that annual members are much more profitable than casual riders.

Moreno (Director of Marketing) has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.
### Business Task
To identify how do annual members and casual riders use Cyclistic differently.
### Data Preparation and Cleaning
* The dataset used for this project is downloaded from the public data. It consists of monthly files covering the period from January 2022 to December 2022.
* Each file within the dataset contains 13 columns each with 100,000 to 750,000 rows related to the bike rides.
* These columns provide detailed information about each ride, including the ride ID, rideable type, start and end station ID’s and locations, coordinates, and membership type.
#### Data Preparation
For the data preparation I used Microsoft SQL Server. The data from each month, spanning from January to December 2022, was imported and merged into a single table called “bike_data”.The steps involved in this process are as follows:

* Importing Data: I imported all the .cvs files containing the ride data into SQL Server.
* Merging Data: After importing the files, I merged the all 12 .csv files into single sql table called “bike_data”. The data from tables were merged using the UNION ALL statement. While merging the data, columns which were needed for the analysis were selected (ride_id, rideable_type, started_at, ended_at, member_casual) and all the other columns were excluded. Also, additional colums were created which are needed for the analysis like seperating date and time from "started_at" column, also used DATEPART and FORMAT functions to get the necessary values like "Month", "Weekday", "MonthNum".
#### Cleaning and Manipulation
* I checked for duplicates and there were none. All ride_id were all unique.
* Then, I looked at the bike types (rideable_type) and user type (membership_type) to check for distinct values, spelling errors, and trailing or leading space. No inconsistency was detected.
* The member_casual column has only values: member and casual. There were no changes made to the column.
* To answer the business question, I created a column named "trip_duration" showing the duration of the ride in minutes and "season" for adding the season according to month of the year.
* I explored the data to see the minimum, average, and maximum ride duration in minutes and hours. I noticed there were negative values in "trip_duration" column, this is an error and needs to be fixed. I removed the rows with negative durations.
### Analysis
For the analysis step, with business question in mind, I performed some summery statistics focusing on the the differece between members and casual riders. Following are the steps I followed:
* I started by calculating the total rides for members and casual riders.
* Then, I analyzed data to see the busiest hour of the day, busiest day of the week, busiest month and season for both members and casual users.
* I also calculated, on average for how much time members and casual riders ride bike during specific day of the week. 
* To see preferred rideable type between memebers and casuals I calculated total rides by bike type.
* Lastly, I went ahead to calculate rides taken by members and causals during specific time of the day, day of week, month and season to anlayze the  trends between them.
### Data visualization
With the help of Tableau, I generated visuals from the data to make complex concepts and numbers easier to see and understand.
In the share phase, we’ll interpret the results of our analysis and share our key findings and recommendations to help stakeholders make data-driven decisions.
You can find the interactive version of dashboard I created for this project on Tableau [here](https://public.tableau.com/app/profile/smita.deshmane4857/viz/CyclisticBikeshareDataAnalysis_17055498717670/CyclisticBIkesharedashboard)

![Cyclistic BIke share dashboard](https://github.com/smita-deshmane/Bike-Share-Data-Analysis/assets/127545460/85e3fe9e-9200-4352-83d2-2cbd8d401683)

#### 1. Percentage of Casual Riders and Annual Members
Annual members accounted for the majority of the rides, representing 59.03% of the total whereas casual riders are 40.97% of total rides.

![Total Rides (2) (2)](https://github.com/smita-deshmane/Bike-Share-Data-Analysis/assets/127545460/4debdd7d-5edd-4830-ac06-6b8611c17055)
#### 2. Number of Rides taken during weekday by Members and Casual Riders
The analysis of the number of rides per day reveals interesting patterns. From Monday to Friday, annual members consistently have a higher count of rides compared to casual riders. However, on weekends (Saturday and Sunday), casual riders exhibit the highest usage, surpassing the number of rides by annual members.


![No of Rides during Weekday by Membership Type (2) (1)](https://github.com/smita-deshmane/Bike-Share-Data-Analysis/assets/127545460/56aa67ac-4516-4d78-9e1d-8db9fbe5ff32)




