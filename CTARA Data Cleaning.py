#################  DATA CLEANING/ DATA PREPROCESSING    #######################

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv(r"C:\Users\badam\Downloads\CTARA Project_dataset.csv")

df.describe()

df.info()
df.shape
df.columns

### 1. TYPECASTING/ TYPE CONVERSION...............................
df.dtypes

help(df.astype)

# Example: CONVERT TO dATETIME...............

df['date'] = pd.to_datetime(df['date'], errors='coerce')
df = df.dropna(subset=['date'])
df['month'] = df['date'].dt.month
df['day_of_week'] = df['date'].dt.dayofweek

#### FOUND THE SERIES OF DATE LIKE 1 ,2 ,3 ,4-----N
series_date = pd.Series(pd.date_range('20200101', periods=6))
series_date

### 2. HANDLING DUPLICATES.......................................

help(df.duplicated)

## FIND DUPLICATES........
# IF FALSE = NO DUPLICTE DATA ,   TRUE = DUPLICATE DATA

duplicate = df.duplicated()
df.duplicated().sum()
duplicate

## SHOWS THE DUPLICATES..............
df[df.duplicated()]

###  COUNTS THE TOTAL OF DUPLICATES.
sum(duplicate)

duplicate = df.duplicated(keep = 'last')
duplicate

df = df.drop_duplicates()

### 3. OUTLIERS..................................
import pandas as pd
import numpy as np
import seaborn as sns

df.dtypes

#####USING IQR   .................. 
numeric_cols = df.select_dtypes(include='number').columns

for col in numeric_cols:
    Q1 = df[col].quantile(0.25)
    Q3 = df[col].quantile(0.75)
    IQR = Q3 - Q1
    lower = Q1 - 1.5 * IQR
    upper = Q3 + 1.5 * IQR
    
    outliers = df[(df[col] < lower) | (df[col] > upper)]
    print({len(outliers)})
    
###USING WINSORIZATION..................
numerical_cols = df.select_dtypes(include=['int64', 'float64']).columns

for col in numerical_cols:
    if col not in ['month', 'day_of_week', 'is_weekend']:
        Q1 = df[col].quantile(0.25)
        Q3 = df[col].quantile(0.75)
        IQR = Q3 - Q1
        lower = Q1 - 1.5 * IQR
        upper = Q3 + 1.5 * IQR
        df[col] = np.where(df[col] < lower, lower, np.where(df[col] > upper, upper, df[col]))


### 4.ZERO AND NON-ZERO VARIANCE..................
numerical_cols = df.select_dtypes(include=['int64', 'float64']).columns

for col in numerical_cols:
    if df[col].var() == 0:
        print(f"Column {col} has zero variance and may be dropped.")

#### 5. HANDLING MISSING VALUES......................


numerical_cols = df.select_dtypes(include=[np.number]).columns.tolist()
for col in numerical_cols:
    df[col] = df[col].fillna(df[col].median())
    
categorical_cols = df.select_dtypes(include=['object','category']).columns
print(categorical_cols)

categorical_cols = ['location_id', 'timestamp', 'state', 'road_type', 'enforcement_level',
       'season', 'lighting', 'weather', 'peak', 'traffic_data_quality_flag',
       'signal_status', 'signal_data_quality_flag', 'severity', 'cause']

for col in categorical_cols:
    df[col] = df[col].fillna(df[col].mode()[0])


### 6. DISCRETIZATION..................................

df['speed_limit_kmph'] = pd.cut(
    df['speed_limit_kmph'],
    bins = 3,
    labels = ['Slow', 'Medium', 'Fast'])

df['blackspot_score'] = pd.cut(
    df['blackspot_score'],
    bins = 3,
    labels = ['Low Risk', 'Medium Risk', 'High Risk'])

df['hour_of_day'] = pd.cut(
    df['hour_of_day'],
    bins = 3,
    labels = ['Late Night', 'Morning Peak', 'Afternoon and Evening Peak'])

df['vehicle_count_per_hr'] = pd.cut(
    df['vehicle_count_per_hr'],
    bins = 3,
    labels = ['Light', 'Moderate', 'Heavy'])

df['avg_speed_kmph'] = pd.cut(
    df['avg_speed_kmph'],
    bins = 3,
    labels = ['Congested', 'Steady Flow', 'Free Flow'])

df['violations_count'] = pd.cut(
    df['violations_count'],
    bins = 3,
    labels = ['Law Abiding', 'Occasional Violations', 'High-Risk Zones'])

## 7.DUMMY VARIABLES..............................

df = pd.get_dummies(df, 
                    drop_first=True)
                    

### 8. TRANSFORMATION.................................

from sklearn.preprocessing import MinMaxScaler
scaler = MinMaxScaler()

transformation_cols = ['vehicle_count_per_hr','veh_count_at_accident',
                 'yellow_duration_s','avg_speed_kmph','violations_count','blackspot_score']

df[transformation_cols] = scaler.fit_transform(df[transformation_cols])

for col in df.select_dtypes(include=['float64']).columns:
    if (df[col] > 0).all():
        df[col] = np.log1p(df[col])


### 9. FEATURE SCALING.........................

from sklearn.preprocessing import StandardScaler

cat_cols = df.select_dtypes(include=['object', 'category', 'bool']).columns

df_encoded = pd.get_dummies(df, columns=cat_cols, drop_first=True)

cols_to_scale = df_encoded.select_dtypes(include=['int64', 'float64']).columns

cols_to_scale = [c for c in cols_to_scale if c not in ['month', 'day_of_week', 'is_weekend']]

df_encoded[cols_to_scale].describe().round(2)


cols_to_scale = [
    'veh_count_at_accident', 
    'cycle_time_s', 'green_duration_s', 'red_duration_s', 
    'yellow_duration_s'
]

scaler = StandardScaler()
df_encoded[cols_to_scale] = scaler.fit_transform(df_encoded[cols_to_scale])

scaler = StandardScaler()
num_cols_final = df.select_dtypes(include=['float64']).columns
df[num_cols_final] = scaler.fit_transform(df[num_cols_final])


### 10 STRING MANIPULATION..............................

df.columns = df.columns.str.strip().str.lower().str.replace(" ", "_")

print(df.columns.tolist())
string_cols = df.select_dtypes(include='object').columns
for col in string_cols:
    df[col] = df[col].astype(str).str.strip().str.lower()
    
for col in df.select_dtypes(include=['object']).columns:
    df[col] = df[col].str.strip().str.lower()


#### DOWNLOAD THE CLEANED DATASET..........................
df.to_csv(
    r"C:\Users\badam\Downloads\cleaned_CTARA_dataset.csv",
    index=False
)
