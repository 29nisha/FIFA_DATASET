CREATE DATABASE dab7;
use dab7;
desc fifa_data;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Fifa.d.csv"
INTO TABLE Fifa_D
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID, Name, Age, Nationality, Overall_rating, potential_rating, Club, Value, Wage, Preferred_Foot, Jersey_No, Joined, Height, Weight, Penalties); 
select * from fifa_d;
-- 1.Retrive all players'infromation from all table.
select * from fifa_d;
-- 2. Get the name and ages of players with overall rating above 85.
SELECT name, age FROM Fifa_D WHERE overall_rating > 85;
-- 3.Find the nationality and potential rating of players with a value over 50 million
SELECT Nationality, potential_rating from Fifa_d where value>50000000;
-- 4. List the names, clubs, and wages of players who prefer their left foot.
select name, club and wage from Fifa_d where preferred_Foot= 'left';
-- 5. Retrieve players' names, ages, and weights who weigh over 70 kg and have penalty rating above 70.
select name, age and weight from Fifa_d where weight>70 and potential_rating>70;
 -- 6. Get the average overall rating of players in the table.
 select AVG(overall_rating) AS overall_rating from Fifa_d;
 -- 7. Find the tallest player's name, height, and jersey number
 select name, height and Jersey_No from Fifa_d order by Height DESC LIMIT 1;
 -- 8. List the name of the player whose age is between 18 to 25.
 select name from Fifa_d where age between 18 and 25;
 -- 9. Find the nationality, value, and preferred foot of players with a potential rating above 90.
 select Nationality,value and preferred_Foot from Fifa_d where potential_rating>90;
 -- 10. Retrieve players with a wage greater than 100,000 and a potential rating above 85.
 select name from Fifa_d where Wage>100000 and Potential_rating>85;
 -- 11. List the names and heights of players who are taller than 180 cm and weigh less than 75 kg.
select name, Height from Fifa_d where Height>180 and Weight<75;
-- 12. Retrieve players with a potential rating greater than their overall rating.
select name from Fifa_d where Potential_rating> Overall_rating;
-- 13. Find the average value of players from each nationality, ordered by average value in descending order.
select Nationality, AVG(value) as avergae_value from Fifa_d GROUP BY Nationality ORDER BY AVG(value) DESC;
-- 14. List the names and jersey numbers of players who have joined the club before 2019 and have a wage above 50,000.
select name, jersey_No from Fifa_d where joined>2019 and Wage>50000;
-- 15. Get the total number of players in the table.
select Count(*) as name from Fifa_d;
-- 16. Find the average age of players who prefer their right foot.
select AVG(age) as average_age from Fifa_d where Preferred_Foot = 'right';
-- 17. Retrieve players with a value greater than 30 million and a wage less than 100,000.
select name from Fifa_d where value>30000000 and wage<100000;
-- 18. List the names and clubs of players whose jersey number is less than 10 and have a potential rating above 80.
select name, club from Fifa_d where Jersey_NO<10 and Potential_rating>80;
-- 19. How many nationalities do these players belong to?
SELECT COUNT(DISTINCT nationality) AS distinct_nationalities FROM Fifa_d;
-- 20. What is the total wage given to all players? What's the average and standard deviation?
SELECT SUM(wage) AS total_wage, AVG(wage) AS average_wage, STD(wage) AS wage_std_dev FROM Fifa_d;
-- 21. Which player has the highest wage? Who has the lowest?
SELECT name, wage FROM Fifa_d  ORDER BY wage DESC LIMIT 1;
SELECT name, wage FROM Fifa_d ORDER BY wage ASC LIMIT 1;  
-- 22. The player having the best overall rating? Worst overall rating?
select Overall_rating from Fifa_d ORDER BY Overall_rating DESC LIMIT 1;
select Overall_rating from Fifa_d ORDER BY Overall_rating ASC LIMIT 1;
-- 23. Club having the highest total of overall rating? Highest average of overall rating?
SELECT club,sum(overall_rating) as total_overall_rating from Fifa_d group by club order by total_overall_rating DESC LIMIT 1;
SELECT club,AVG(overall_rating) as AVG_overall_rating from Fifa_d group by club order by AVG_overall_rating DESC LIMIT 1;
-- 24. What are the top 5 clubs based on the average ratings of their players?
SELECT club,AVG(overall_rating) as AVG_overall_rating from Fifa_d group by club order by AVG_overall_rating DESC LIMIT 5;
-- 25. What is the distribution of players whose preferred foot is left vs right?
SELECT preferred_foot ,count(*) as count from Fifa_d group by  preferred_foot;
-- 26. Which jersey number is the luckiest?
SELECT Jersey_No,count(*) as count from Fifa_d  group by Jersey_No  order by count DESC LIMIT 1;
-- 27. What is the frequency distribution of nationalities among players whose club name starts with M?
SELECT nationality, count(*) as count from Fifa_d where club  like 'M%' group by nationality;
-- 28. How many players have joined their respective clubs in the date range 20 May 2018 to 10 April 2019 (both inclusive)?
select count(*) as players_joined from Fifa_d group by Joined between '2018-5-20' and '2019-4-10';
-- 29. How many players have joined their respective clubs date-wise?
select count(*) as players_joined from Fifa_d group by Joined;
-- 30. How many players have joined their respective clubs yearly
select year(Joined) as year, count(*) as players_joined from Fifa_d group by year(Joined) order by year;
