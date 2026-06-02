1. Average Calories Burned by Workout Type
-------------------------------------------
select 
round (avg(calories_burned),2) as avg_calories, workout_type
from gym_member_tracker
group by workout_type
order by avg_calories desc

2. Most Popular Workout Type
----------------------------

select workout_type, count(*) as total_members
from gym_member_tracker
group by workout_type
order by total_members desc

3. BMI Category Distribution
----------------------------

select bmi_category, count(*) as total_members
from gym_member_tracker
group by bmi_category

4. Average Session Duration by Experience Level
-----------------------------------------------
select 
round(avg(`session_duration (hours)`),2), experience_level
from gym_member_tracker
group by experience_level

5. Calories Burned by Gender
------------------------------

select gender, 
avg(calories_burned) as avg_calories
from gym_member_tracker
where gender <> ''
group by gender;

6. Workout Frequency Analysis
-----------------------------
select (`workout_frequency (days/week)`),
count(*) as member
from gym_member_tracker
group by (`workout_frequency (days/week)`)
order by member

7. Top BMI Groups by Calories Burned
------------------------------------
select bmi_category, 
round(avg(calories_burned),2) as avg_calories
from gym_member_tracker
group by bmi_category
order by avg_calories desc;

8. Ranking Workout Types using RANK()
-------------------------------------

select workout_type, 
round(avg(calories_burned),2) as avg_calories,
rank() over( 
order by avg(calories_burned) desc 
) as calorie_rank 
from gym_member_tracker
group by workout_type;

9. Fitness Segmentation
-------------------------

select gender, workout_type, 
round(avg(calories_burned),2) as avg_calories,
round(avg(bmi),2) as avg_bmi
from gym_member_tracker
where gender <> ''
group by gender, workout_type;

