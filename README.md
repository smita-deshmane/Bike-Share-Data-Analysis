# Case study:  Cyclistic Bike Share Analysis - Differentiating Casual Riders and Annual Members
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
* To identify how do annual members and casual riders use Cyclistic differently.
* To find ways to convert casual riders into annual members  

### Data Preparation and Cleaning

* The dataset used for this project is downloaded from the public data. It consists of monthly files covering the period from January 2022 to December 2022.

* Each file within the dataset contains 13 columns each with 100,000 to 750,000 rows related to the bike rides.

* These columns provide detailed information about each ride, including the ride ID, rideable type, start and end station ID’s and locations, coordinates, and membership type.

#### Data Preparation

For the data preparation, I used Microsoft SQL Server. The data from each month, spanning from January to December 2022, was imported and merged into a single table called “bike_data”.The steps involved in this process are as follows:



* Importing Data: I imported all the .cvs files containing the ride data into SQL Server.

* Merging Data: After importing the files, I merged all 12 .csv files into a single SQL table called “bike_data”. The data from the tables were merged using the UNION ALL statement. While merging the data, columns that were needed for the analysis were selected (ride_id, rideable_type, started_at, ended_at, member_casual) and all the other columns were excluded. Also, additional columns were created which are needed for the analysis like separating date and time from the "started_at" column, also used DATEPART and FORMAT functions to get the necessary values like "Month", "Weekday", and "MonthNum".


#### Cleaning and Manipulation
* I checked for duplicates and there were none. All ride_id were all unique.
* Then, I looked at the bike types (rideable_type) and user type (membership_type) to check for distinct values, spelling errors, and trailing or leading space. No inconsistency was detected.

* The member_casual column has only values: member and casual. There were no changes made to the column.

* To answer the business question, I created a column named "trip_duration" showing the duration of the ride in minutes and "season" for adding the season according to the month of the year.

* I explored the data to see the minimum, average, and maximum ride duration. I noticed there were negative values in the "trip_duration" column, this is an error and needs to be fixed. I removed the rows with negative durations.

### Analysis

For the analysis step, with a business question in mind, I performed some summary statistics focusing on the difference between members and casual riders. Following are the steps I followed:

* I started by calculating the total rides for members and casual riders.

* Then, I analyzed total rides data to see the busiest hour of the day, busiest day of the week, busiest month, and season.

* I also calculated, on average how much time members and casual riders ride bikes during specific days of the week. 

* To see the preferred rideable type between members and casuals, I calculated total rides by bike type.

* Lastly, I went ahead to calculate rides taken by members and causals during specific times of the day, days of the week, months, and seasons to analyze the trends between them.

### Data visualization

With the help of Tableau, I generated visuals from the data to make complex concepts and numbers easier to see and understand.

In the sharing phase, we’ll interpret the results of our analysis and share our key findings and recommendations to help stakeholders make data-driven decisions.

You can find the interactive version of the dashboard I created for this project on Tableau [here](https://public.tableau.com/app/profile/smita.deshmane4857/viz/CyclisticBikeshareDataAnalysis_17055498717670/CyclisticBIkesharedashboard)

![Cyclistic BIke share dashboard](https://github.com/smita-deshmane/Bike-Share-Data-Analysis/assets/127545460/85e3fe9e-9200-4352-83d2-2cbd8d401683)

#### 1. Percentage of Casual Riders and Annual Members
Annual members accounted for the majority of the rides, representing 59.03% of the total whereas casual riders are 40.97% of total rides.

![Total Rides (2) (2)](https://github.com/smita-deshmane/Bike-Share-Data-Analysis/assets/127545460/4debdd7d-5edd-4830-ac06-6b8611c17055)
#### 2. Number of Rides taken per day by Members and Casual Riders
The analysis of the number of rides per day reveals interesting patterns. From Monday to Friday, annual members consistently have a higher count of rides compared to casual riders. However, on weekends (Saturday and Sunday), casual riders exhibit the highest usage, surpassing the number of rides by annual members.


![No of Rides during Weekday by Membership Type (2) (1)](https://github.com/smita-deshmane/Bike-Share-Data-Analysis/assets/127545460/56aa67ac-4516-4d78-9e1d-8db9fbe5ff32)

#### 3. Number of Rides taken per Month by Members and Casual Riders
This analysis reveals that annual members consistently have a higher number of rides compared to casual riders in all months. Both annual members and casual riders have the highest proportion of rides in the months June and July. The freqency of rides significantly going down for both members and casuals in the months of January and February.

![Number of Rides by Month and Membership Type](https://github.com/smita-deshmane/Bike-Share-Data-Analysis/assets/127545460/be16e97b-c4db-40da-9ad8-0bca12f1111c)

#### 4. Average Ride Duration(in minutes) per day for Members and Casual Riders 
On average, casual riders have significantly longer ride durations compared to annual members. Members tend to have consistent rides throught the week, whereas, casual users tend to drive for longer periods over the weenkend.

![Trip Duration in Weekday ](https://github.com/smita-deshmane/Bike-Share-Data-Analysis/assets/127545460/45002335-1568-4581-8573-ac75b951af8f)

#### 5. Frequency of Rides per Hour for Members and Casual Riders
The line graph illustrates variations in the frequency of rides per hour for both annual members and casual riders. Both rider type experience peak usage at 5pm. Members showing peak hour in the morning at 8am as well. 

![Rides Started per Hour](https://github.com/smita-deshmane/Bike-Share-Data-Analysis/assets/127545460/d95f8607-4f17-4092-8a1a-b64c014d09c6)

#### 6. Number of Rides per Season
Overall, annual members consistently have the highest proportion of rides in all seasons compared to casual riders. However, during winters, annual members have the highest proportion of rides as compared to casual riders. On the other hand, casual riders have the highest proportion of rides during summers making it equivalent to annual members. 


![Sheet 8](https://github.com/smita-deshmane/Bike-Share-Data-Analysis/assets/127545460/2269d49d-3599-4810-b8a4-6984920c6e06)

### Act Phase
#### Key Findings

* Members preferred riding the bike on weekdays, whereas casual riders are more likely to ride on weekends
* Members demonstrate peak usage at 8 am and 5 pm, whereas casual showing peak usage only at 5 pm
* Members have peak usage overall on Thursdays, and casual riders have peak usage on Saturdays
* Casual riders preferred taking long-duration rides with the highest on weekends, whereas members preferred shorter rides consistently during the week
* Both members and casuals are more likely to ride in the summer months, with July being the most popular time to ride bikes
* With the change in weather, the bike usage between members and casual riders has significantly lowered in January and February

#### Strategies to convert more Casual Riders into Annual Members

* Since casual riders prefer riding the bike in the summer season and over the weekend, offer a membership plan that will provide discounts in the months of summer and weekends
* If we consider annual members use bikes for daily commuting, running a marketing campaign on how riding the bike to work is healthy, cost-effective, and environmentally friendly will be helpful in convincing casuals to buy an annual membership
* Also, casual riders prefer taking longer rides, making a membership plan that will allow longer rides over the weekends will help convert casual riders into annual members


Thank you.
