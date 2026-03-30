/********************** DATA PREPROCESSING ************************************/
-------- TYPECASTING -------

SELECT COUNT(*) AS empty_loction_id
FROM ctara_project_dataset
WHERE location_id = '';

SELECT *
FROM ctara_project_dataset;


ALTER TABLE ctara_project_dataset
MODIFY date DATE,
MODIFY location_id VARCHAR(50),
MODIFY lane_count VARCHAR(50),
MODIFY speed_limit_kmph VARCHAR(50);

DESCRIBE ctara_project_dataset;

----- OUTLIERS --------

WITH ordered_data AS(
	SELECT hour_of_day,
		ROW_NUMBER() OVER (ORDER BY hour_of_day) AS rn,
		COUNT(*) OVER() AS total_rows
	FROM ctara_project_dataset
)

SELECT
	MAX(CASE WHEN rn = FLOOR(0.25 * (total_rows+1))THEN hour_of_day END) AS Q1,
    MAX(CASE WHEN rn = FLOOR(0.75 * (total_rows+1))THEN hour_of_day END) AS Q3
FROM  ordered_data;

SELECT * 
FROM ctara_project_dataset,STATS
WHERE hour_of_day < (Q1 - 1.5*(Q3-Q1))
or	  hour_of_day > (Q1 + 1.5*(Q3-Q1));

----- ZEO AND NEAR ZERO VARIANCE -----

SELECT 
	MIN(signal_status) AS MIN_VAL,
    MAX(signal_status) AS MAX_VAL
FROM ctara_project_dataset;

SELECT
	COUNT(DISTINCT signal_status) AS DISTINCT_VAL
FROM  ctara_project_dataset;

SELECT
    STDDEV_POP(signal_status) AS std_dev
FROM ctara_project_dataset;

SELECT
	COUNT(DISTINCT signal_status) AS DISTINCT_VAL
FROM  ctara_project_dataset;

-------- DISCRETIZATION ------------
-- speed_limit_kmph--
SELECT
	speed_limit_kmph,
    CASE
		WHEN speed_limit_kmph BETWEEN 0 AND 10 THEN 'LOW'
		WHEN speed_limit_kmph BETWEEN 10 AND 20 THEN 'MEDIUM'
		ELSE 'FAST'
	END AS speed_limit_category
FROM ctara_project_dataset;

-- blackspot_score--
SELECT
	blackspot_score,
    CASE
		WHEN blackspot_score BETWEEN 0 AND 10 THEN 'LOW RISK'
		WHEN blackspot_score BETWEEN 10 AND 20 THEN 'MEDIUM RISK'
		ELSE 'HIGH RISK'
	END AS blackspot_score_category
FROM ctara_project_dataset;

-- hour_of_day--
SELECT
	hour_of_day,
    CASE
		WHEN hour_of_day BETWEEN 0 AND 10 THEN 'LATE NIGHT'
		WHEN hor_of_day BETWEEN 10 AND 20 THEN 'MORNING PEAK'
		ELSE 'EVENING PEAK'
	END AS hour_of_day_category
FROM ctara_project_dataset;

-- vehicle_count_per_hr--
SELECT
	vehicle_count_per_hr,
    CASE
		WHEN vehicle_count_per_hr BETWEEN 0 AND 10 THEN 'LIGHT'
		WHEN vehicle_count_per_hr BETWEEN 10 AND 20 THEN 'MODERATE'
		ELSE 'HEAVY'
	END AS vehicle_count_category
FROM ctara_project_dataset;

-- day_of_week--
SELECT
	 day_of_week,
     CASE
		WHEN  day_of_week < 50 THEN 'UNDERUTILIZED'
        WHEN  day_of_week BETWEEN 50 AND 80 THEN 'OPTIMAL'
        ELSE 'OVERUTILIZED'
	END  AS  day_of_week_cat
FROM ctara_project_dataset;

------- -- FEATURE SCALING ---------
-- veh_count_at_accident', 
-- 'cycle_time_s',
-- 'green_duration_s', 
-- 'red_duration_s', 
-- 'yellow_duration_s
    
-- vehicle_count_per_hr ----
SELECT 
	vehicle_count_per_hr,
    (vehicle_count_per_hr - stats.min_val)/
    (stats.max_val - stats.min_val) AS Scaled_vehicle_count
FROM ctara_project_dataset
CROSS JOIN(
	SELECT
    MIN(vehicle_count_per_hr) AS min_val,
    MAX(vehicle_count_per_hr) AS max_val
    FROM ctara_project_dataset
) stats;
    