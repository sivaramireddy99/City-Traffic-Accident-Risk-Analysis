-- DATA CLEANING : -----------------------------------------------------------------------------------------------

USE ctara;

DESCRIBE ctara_project_dataset;

-- "balckspot_score","latitude","longitude","day_of_week","hour_of_day","vehicle_count_per_hr","avg_speed_kmph",
-- "green_duration_s","red_duration_s","yellow_duration_s","cycle_time_s","violations_count","veh_count_at_accident"

-- MISSING( NULL) VALUES : ----------------------------------------------------
SELECT 
    COUNT(*) AS total_rows,
    SUM(location_id IS NULL) AS location_id_nulls,
    SUM(timestamp IS NULL) AS timestamp_nulls,
    SUM(state IS NULL) AS state_nulls,
    SUM(road_type IS NULL) AS road_type_nulls,
    SUM(lane_count IS NULL) AS lane_count_nulls,
    SUM(speed_limit_kmph IS NULL) AS speed_limit_kmph_nulls,
    SUM(has_signal IS NULL) AS has_signal_nulls,
    SUM(enforcement_level IS NULL) AS enforcement_nulls,
    SUM(blackspot_score IS NULL) AS equipment_id_nulls,
    SUM(latitude IS NULL) AS latitude_nulls,
    SUM(longitude IS NULL) AS longitude_nulls,
	SUM(season IS NULL) AS season_nulls,
    SUM(day_of_week IS NULL) As day_of_week_nulls,
    SUM(hour_of_day IS NULL) AS hour_of_day_nulls,
    SUM(lighting IS NULL) AS lighting_nulls,
    SUM(weather IS NULL) AS weather_nulls,
    SUM(is_peak IS NULL) AS is_peak_nulls,
    SUM(vehicle_count_per_hr IS NULL) AS veh_count_per_hr_nulls,
    SUM(avg_speed_kmph IS NULL) AS avg_speed_kmph_nulls,
    SUM(peak IS NULL) AS peak_nulls,
    SUM(traffic_data_quality_flag IS NULL) AS traffic_nulls,
    SUM(signal_status IS NULL) AS signal_status_nulls,
    SUM(green_duration_s IS NULL) AS green_duration_s_nulls,
    SUM(red_duration_s IS NULL) AS red_duration_nulls,
    SUM(yellow_duration_s IS NULL) AS yellow_nulls,
    SUM(cycle_time_s IS NULL) AS cycle_nulls,
    SUM(violations_count IS NULL) AS violations_nulls,
    SUM(signal_data_quality_flag IS NULL) As signal_nulls,
    SUM(accident_occurred IS NULL) AS accident_nulls,
    SUM(severity IS NULL) AS severity_nulls,
    SUM(vehicles_involved IS NULL) AS vehicle_nulls,
    SUM(cause IS NULL) AS cause_nulls,
    SUM(veh_count_at_accident IS NULL) AS veh_count_at_nulls
FROM
    ctara_project_dataset;


-- REPLACING NULL VALUES WITH "MEAN"/"MEDIUM" FOR NUMERICAL COLUMNS, "MODE" FOR CATEGORICAL COLUMNS.......................

UPDATE ctara_project_dataset
SET lane_count =
(
    SELECT AVG(total_cases_day_lab)
    FROM ctara_project_dataset
)
WHERE lane_count IS NULL;

-- HANDLING WITH DUPLICATES................................................

SELECT
	location_id,
timestamp,
state, 
road_type, 
lane_count, 
speed_limit_kmph, 
has_signal,
enforcement_level, 
blackspot_score, 
latitude ,
longitude,
season, 
day_of_week, 
hour_of_day , 
lighting , 
weather , 
is_peak ,
vehicle_count_per_hr , 
avg_speed_kmph , 
peak ,
traffic_data_quality_flag, 
signal_status ,
green_duration_s , 
red_duration_s ,
yellow_duration_s , 
cycle_time_s , 
violations_count,
signal_data_quality_flag,
accident_occurred,
severity,
vehicles_occurred,
cause,
veh_count_at_accident,
    COUNT(*) AS CNT
FROM ivf_equipment_utilization
GROUP BY 	location_id,
timestamp,
state, 
road_type, 
lane_count, 
speed_limit_kmph, 
has_signal,
enforcement_level, 
blackspot_score, 
latitude ,
longitude,
season, 
day_of_week, 
hour_of_day , 
lighting , 
weather , 
is_peak ,
vehicle_count_per_hr , 
avg_speed_kmph , 
peak ,
traffic_data_quality_flag, 
signal_status ,
green_duration_s , 
red_duration_s ,
yellow_duration_s , 
cycle_time_s , 
violations_count,
signal_data_quality_flag,
accident_occurred,
severity,
vehicles_occurred,
cause,
veh_count_at_accident
HAVING COUNT(*)>1;

CREATE TABLE ctara_project_dataset_backup AS
SELECT * FROM ctara_project_dataset;

DELETE FROM ctara_project_dataset
WHERE (	
location_id,timestamp,state, road_type, lane_count, speed_limit_kmph, has_signal,enforcement_level, blackspot_score, latitude ,
longitude,season, day_of_week, hour_of_day , lighting , weather , is_peak ,vehicle_count_per_hr , avg_speed_kmph , peak ,
traffic_data_quality_flag, signal_status ,green_duration_s , red_duration_s ,yellow_duration_s , violations_count,
signal_data_quality_flag,accident_occurred,severity,vehicles_occurred,cause,veh_count_at_accident
)
IN (
    SELECT 
	location_id,timestamp,state, lane_count, speed_limit_kmph,has_signal,enforcement_level, blackspot_score, latitude ,longitude,
season, day_of_week, hour_of_day , lighting , weather , is_peak ,vehicle_count_per_hr , peak , traffic_data_quality_flag,
signal_status ,green_duration_s , red_duration_s ,yellow_duration_s , cycle_time_s , violations_count,signal_data_quality_flag,accident_occurred,
severity,vehicles_occurred,cause,veh_count_at_accident
    FROM (
        SELECT *,
               ROW_NUMBER() OVER (
                   PARTITION BY
location_id,timestamp,state, lane_count, speed_limit_kmph, has_signal,enforcement_level, blackspot_score, latitude ,longitude,season, day_of_week, hour_of_day , 
lighting , weather , is_peak ,avg_speed_kmph , peak ,signal_status ,red_duration_s ,yellow_duration_s , cycle_time_s , violations_count,
signal_data_quality_flag,accident_occurred,severity,cause,veh_count_at_accident,
                   ORDER BY date
               ) AS rn
        FROM ctara_project_dataset
    ) t
    WHERE rn > 1
);
SET SQL_SAFE_UPDATES = 0;


