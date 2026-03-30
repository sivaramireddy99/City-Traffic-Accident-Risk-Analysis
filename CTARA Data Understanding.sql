CREATE DATABASE CTARA;

USE CTARA;

RENAME TABLE `ctara project_dataset` TO ctara_project_dataset;

-- FIRST BUSINESS MOMENTS DECISION---------------------------------------------------------------------------------

## 1) MEAN : ------------------------------------------
SELECT 
    AVG(lane_count) AS MEAN_VALUE
    FROM ctara_project_dataset;
SELECT 
    AVG(speed_limit_kmph) AS MEAN_VALUE
    FROM ctara_project_dataset;
SELECT 
    AVG(blackspot_score) AS MEAN_VALUE
    FROM ctara_project_dataset;
SELECT 
    AVG(latitude) AS MEAN_VALUE
    FROM ctara_project_dataset;
SELECT 
    AVG(longitude) AS MEAN_VALUE
    FROM ctara_project_dataset;
SELECT 
    AVG(day_of_week) AS MEAN_VALUE
    FROM ctara_project_dataset;
SELECT 
    AVG(hour_of_day) AS MEAN_VALUE
    FROM ctara_project_dataset;
SELECT 
    AVG(vehicle_count_per_hr) AS MEAN_VALUE
    FROM ctara_project_dataset;
SELECT 
    AVG(avg_speed_kmph) AS MEAN_VALUE
    FROM ctara_project_dataset;
SELECT 
    AVG(green_duration_s) AS MEAN_VALUE
    FROM ctara_project_dataset;
SELECT 
    AVG(red_duration_s) AS MEAN_VALUE
    FROM ctara_project_dataset;
SELECT 
    AVG(yellow_duration_s) AS MEAN_VALUE
    FROM ctara_project_dataset;
SELECT 
    AVG(cycle_time_s) AS MEAN_VALUE
    FROM ctara_project_dataset;
SELECT 
    AVG(violations_count) AS MEAN_VALUE
    FROM ctara_project_dataset;
SELECT 
    AVG(veh_count_at_accident) AS MEAN_VALUE
    FROM ctara_project_dataset;

 
 ## 2) MEDIUM : ------------------------------------
 
SELECT AVG(lane_count) AS MEDIAN_VALUE
FROM (
    SELECT lane_count,
           ROW_NUMBER() OVER (ORDER BY lane_count) AS LC,
           COUNT(*) OVER () AS total_rows
    FROM ctara_project_dataset
) t
WHERE LC IN (FLOOR((total_rows + 1) / 2),
             CEIL((total_rows + 1) / 2));

SELECT AVG(speed_limit_kmph) AS MEDIAN_VALUE
FROM (
    SELECT speed_limit_kmph,
           ROW_NUMBER() OVER (ORDER BY speed_limit_kmph) AS slk,
           COUNT(*) OVER () AS total_rows
    FROM ctara_project_dataset
) t
WHERE slk IN (FLOOR((total_rows + 1) / 2),
             CEIL((total_rows + 1) / 2));
             
SELECT AVG(speed_limit_kmph) AS MEDIAN_VALUE
FROM (
    SELECT speed_limit_kmph,
           ROW_NUMBER() OVER (ORDER BY speed_limit_kmph) AS slk,
           COUNT(*) OVER () AS total_rows
    FROM ctara_project_dataset
) t
WHERE slk IN (FLOOR((total_rows + 1) / 2),
             CEIL((total_rows + 1) / 2));

SELECT AVG(blackspot_score) AS MEDIAN_VALUE
FROM (
    SELECT blackspot_score,
           ROW_NUMBER() OVER (ORDER BY blackspot_score) AS bs,
           COUNT(*) OVER () AS total_rows
    FROM ctara_project_dataset
) t
WHERE bs IN (FLOOR((total_rows + 1) / 2),
             CEIL((total_rows + 1) / 2));

SELECT AVG(latitude) AS MEDIAN_VALUE
FROM (
    SELECT latitude,
           ROW_NUMBER() OVER (ORDER BY latitude) AS la,
           COUNT(*) OVER () AS total_rows
    FROM ctara_project_dataset
) t
WHERE la IN (FLOOR((total_rows + 1) / 2),
             CEIL((total_rows + 1) / 2));

SELECT AVG(longitude) AS MEDIAN_VALUE
FROM (
    SELECT longitude,
           ROW_NUMBER() OVER (ORDER BY longitude) AS lo,
           COUNT(*) OVER () AS total_rows
    FROM ctara_project_dataset
) t
WHERE lo IN (FLOOR((total_rows + 1) / 2),
             CEIL((total_rows + 1) / 2));

SELECT AVG(day_of_week) AS MEDIAN_VALUE
FROM (
    SELECT day_of_week,
           ROW_NUMBER() OVER (ORDER BY day_of_week) AS dow,
           COUNT(*) OVER () AS total_rows
    FROM ctara_project_dataset
) t
WHERE dow IN (FLOOR((total_rows + 1) / 2),
             CEIL((total_rows + 1) / 2));

SELECT AVG(hour_of_day) AS MEDIAN_VALUE
FROM (
    SELECT hour_of_day,
           ROW_NUMBER() OVER (ORDER BY hour_of_day) AS hod,
           COUNT(*) OVER () AS total_rows
    FROM ctara_project_dataset
) t
WHERE hod IN (FLOOR((total_rows + 1) / 2),
             CEIL((total_rows + 1) / 2));

SELECT AVG(vehicle_count_per_hr) AS MEDIAN_VALUE
FROM (
    SELECT vehicle_count_per_hr,
           ROW_NUMBER() OVER (ORDER BY vehicle_count_per_hr) AS vcph,
           COUNT(*) OVER () AS total_rows
    FROM ctara_project_dataset
) t
WHERE vcph IN (FLOOR((total_rows + 1) / 2),
             CEIL((total_rows + 1) / 2));

SELECT AVG(avg_speed_kmph) AS MEDIAN_VALUE
FROM (
    SELECT avg_speed_kmph,
           ROW_NUMBER() OVER (ORDER BY avg_speed_kmph) AS ask,
           COUNT(*) OVER () AS total_rows
    FROM ctara_project_dataset
) t
WHERE ask IN (FLOOR((total_rows + 1) / 2),
             CEIL((total_rows + 1) / 2));

SELECT AVG(green_duration_s) AS MEDIAN_VALUE
FROM (
    SELECT green_duration_s,
           ROW_NUMBER() OVER (ORDER BY green_duration_s) AS gds,
           COUNT(*) OVER () AS total_rows
    FROM ctara_project_dataset
) t
WHERE gds IN (FLOOR((total_rows + 1) / 2),
             CEIL((total_rows + 1) / 2));

SELECT AVG(red_duration_s) AS MEDIAN_VALUE
FROM (
    SELECT red_duration_s,
           ROW_NUMBER() OVER (ORDER BY red_duration_s) AS rds,
           COUNT(*) OVER () AS total_rows
    FROM ctara_project_dataset
) t
WHERE rds IN (FLOOR((total_rows + 1) / 2),
             CEIL((total_rows + 1) / 2));

SELECT AVG(yellow_duration_s) AS MEDIAN_VALUE
FROM (
    SELECT yellow_duration_s,
           ROW_NUMBER() OVER (ORDER BY yellow_duration_s) AS yds,
           COUNT(*) OVER () AS total_rows
    FROM ctara_project_dataset
) t
WHERE yds IN (FLOOR((total_rows + 1) / 2),
             CEIL((total_rows + 1) / 2));

SELECT AVG(cycle_time_s) AS MEDIAN_VALUE
FROM (
    SELECT cycle_time_s,
           ROW_NUMBER() OVER (ORDER BY cycle_time_s) AS cts,
           COUNT(*) OVER () AS total_rows
    FROM ctara_project_dataset
) t
WHERE cts IN (FLOOR((total_rows + 1) / 2),
             CEIL((total_rows + 1) / 2));

SELECT AVG(violation_count) AS MEDIAN_VALUE
FROM (
    SELECT violation_count,
           ROW_NUMBER() OVER (ORDER BY violation_count) AS vc,
           COUNT(*) OVER () AS total_rows
    FROM ctara_project_dataset
) t
WHERE vc IN (FLOOR((total_rows + 1) / 2),
             CEIL((total_rows + 1) / 2));

SELECT AVG(veh_count_at_accident) AS MEDIAN_VALUE
FROM (
    SELECT veh_count_at_accident,
           ROW_NUMBER() OVER (ORDER BY veh_count_at_accident) AS vcaa,
           COUNT(*) OVER () AS total_rows
    FROM ctara_project_dataset
) t
WHERE vcaa IN (FLOOR((total_rows + 1) / 2),
             CEIL((total_rows + 1) / 2));



## 3) MODE : ---------------------------------------------

 SELECT lane_count AS MODE_VALUE
FROM ctara_project_dataset
GROUP BY lane_count
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT speed_limit_kmph AS MODE_VALUE
FROM ctara_project_dataset
GROUP BY speed_limit_kmph
ORDER BY COUNT(*) DESC
LIMIT 1;

-- "balckspot_score","latitude","longitude","day_of_week","hour_of_day","vehicle_count_per_hr","avg_speed_kmph",
-- "green_duration_s","red_duration_s","yellow_duration_s","cycle_time_s","violations_count","veh_count_at_accident"
 
 -- SECOND BUSINESS MOMENTS DECISIONS :----------------------------------------------------------------------------
 ## 1) VARAIANCE : --------------------------------------
 
 SELECT 
    VARIANCE(lane_count) AS VARIANCE_VALUE
FROM
    ctara_project_dataset;

 SELECT
    VARIANCE(speed_limit_kmph) AS VARIANCE_VALUE
FROM ctara_project_dataset;

 SELECT
    VARIANCE(utilization_pct) AS VARIANCE_VALUE
FROM ivf_equipment_utilization_2yrs;

-- "balckspot_scopre","latitude","longitude","day_of_week","hour_of_day","vehicle_count_per_hr","avg_speed_kmph",
-- "green_duration_s","red_duration_s","yellow_duration_s","cycle_time_s","violations_count","veh_count_at_accident"

## 2) STANDARD DEVIATION : --------------------------------
SELECT    
    STDDEV(lane_count) AS STD_DEVIATION_VALUE
FROM ctara_project_dataset;

SELECT    
    STDDEV(speed_limit_kmph) AS STD_DEVIATION_VALUE
FROM ctara_limit_kmph;

-- "balckspot_score","latitude","longitude","day_of_week","hour_of_day","vehicle_count_per_hr","avg_speed_kmph",
-- "green_duration_s","red_duration_s","yellow_duration_s","cycle_time_s","violations_count","veh_count_at_accident"


## 3) RANGE :-----------------------------------
  
SELECT
    MAX(lane_count) - MIN(lane_count) AS RANGE_VALUE
FROM ctara_project_dataset;

SELECT
    MAX(speed_limit_kmph) - MIN(speed_limit_kmph) AS RANGE_VALUE
FROM ctara_project_dataset;

-- "balckspot_scopre","latitude","longitude","day_of_week","hour_of_day","vehicle_count_per_hr","avg_speed_kmph",
-- "green_duration_s","red_duration_s","yellow_duration_s","cycle_time_s","violations_count","veh_count_at_accident"


-- THIRD BUSINESS MOMENT DECISIONS : --------------------------------------------------------------------------------

## 1) SKEWNESS :-------------------------

SELECT
    AVG(POWER(lane_count - stats.mean_util, 3)) /
    POWER(MAX(stats.stddev_util), 3) AS skewness
FROM ctara_project_dataset
CROSS JOIN (
    SELECT
        AVG(lane_count) AS mean_util,
        STDDEV_POP(lane_count) AS stddev_util
    FROM ctara_project_dataset
) stats;

-- "speed_limit_kmph","balckspot_score","latitude","longitude","day_of_week","hour_of_day","vehicle_count_per_hr","avg_speed_kmph",
-- "green_duration_s","red_duration_s","yellow_duration_s","cycle_time_s","violations_count","veh_count_at_accident"

-- FOURTH BUSINESS MOMENT DECISIONS : ---------------------------------------------------------------------------------

## 1) KURTOSIS :-----------------------
     
SELECT
    AVG(POWER(lane_count - stats.mean_util, 4)) /
    POWER(MAX(stats.stddev_util), 4) AS kurtosis
FROM ctara_project_dataset
CROSS JOIN (
    SELECT
        AVG(lane_count) AS mean_util,
        STDDEV_POP(lane_count) AS stddev_util
    FROM ctara_project_dataset
) stats;

-- "speed_limit_kmph","balckspot_score","latitude","longitude","day_of_week","hour_of_day","vehicle_count_per_hr","avg_speed_kmph",
-- "green_duration_s","red_duration_s","yellow_duration_s","cycle_time_s","violations_count","veh_count_at_accident"
