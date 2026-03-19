########################IVF EQUIPMENTS PROJECT #################################
##### DATA UNDERSTANDING ###############
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv(r"C:\Users\badam\Downloads\CTARA Project_dataset.csv")

df.shape  

df.dtypes   

df.head()  

df.tail()   

df.head(15)   
df.tail(15)

df.describe()   
df.describe(include = 'object') 

df.info()  ### SHOWS FULL INFORMATION ABOUT DATAFRAME.

df.columns

CTARA = ['location_id', 'timestamp', 'state', 'road_type', 'lane_count',
       'speed_limit_kmph', 'has_signal', 'enforcement_level',
       'blackspot_score', 'latitude', 'longitude', 'season', 'day_of_week',
       'hour_of_day', 'lighting', 'weather', 'is_peak', 'vehicle_count_per_hr',
       'avg_speed_kmph', 'peak', 'traffic_data_quality_flag', 'signal_status',
       'green_duration_s', 'red_duration_s', 'yellow_duration_s',
       'cycle_time_s', 'violations_count', 'signal_data_quality_flag',
       'accident_occurred', 'severity', 'vehicles_involved', 'cause',
       'veh_count_at_accident']

CTARA = df.iloc[:,:-1].select_dtypes(include = "number")

###### 1.  FIRST MOMENT OF BUSINESS DECISION:---MEAN , MEDIAN, MODE
###### 2.  SECOND MOMENT OF BUSINESS DECISION:--- VARIANCE, STANDARD DEVIATION, RANGE
###### 3.  THIRD MOMENT OF BUSINESS DECISION :---- SKEWENESS
###### 4. FOURTH MOMENT OF BUSINESS DECISION :m---- KURTOSIS

for col in CTARA :
    print(f"\nStatistics for {col}:")
    print(f"Mean : {df[col].mean()}")
    print(f"Median : {df[col].median()}")
    print(f"Mode : {df[col].mode()[0]}")
    print(f"Variance : {df[col].var()}")
    print(f"Standard Deviation : {df[col].std()}")
    print(f"Range : {df[col].max() - df[col].min()}")
    print(f"Skewness : {df[col].skew()}")
    print(f"Kurtosis : {df[col].kurt()}")


########## GRAPHICAL REPRSENTATION ## : ------------------------------
#######    UNIVARIATE PLOTS  :------------------------------..........
### 1.. HISTOGRAM PLOT.............

import matplotlib.pyplot as plt

for col in CTARA :
    plt.figure
    plt.hist(df[col])
    plt.title(f'Histogram of {col}')
    plt.xlabel(col)
    plt.ylabel('Frequency')
    plt.show()
    
#####  DENSITY PLOT...............
import seaborn as sns

for col in CTARA :
    sns.distplot(df[col])
    sns.kdeplot(df[col])
    plt.xlabel(col)
    plt.ylabel('Density')
    plt.show()
    
##### BOX PLOT....................
import matplotlib.pyplot as plt

for col in CTARA :
    plt.figure
    plt.boxplot(df[col])
    plt.title(f'box plot of {col}')
    plt.xlabel(col)
    plt.ylabel('Frequency')
    plt.show()

#####   Q-Q PLOT..................
import scipy.stats as stats

for col in df.select_dtypes(include=['float64','int64']).columns:
    plt.figure(figsize=(5,5))
    stats.probplot(df[col].dropna(), dist="norm", plot=plt)
    plt.title(f"Q-Q Plot: {col}")
    plt.show()

#### 2..BIVARIATE PLOTS ................................................
#####  SCATTER PLOT.................
  
colors = ['blue', 'red', 'green', 'orange', 'purple', 'brown', 
          'pink', 'cyan', 'magenta', 'yellow', 'grey', 'olive', 'teal', 'lime']
## NUMERICAL COLUMNS : -
'''lane_count
speed_limit_kmph
blackspot_score 
latitude & longitude 
day_of_week 
hour_of_day 
vehicle_count_per_hr 
avg_speed_kmph 
green_duration_s, red_duration_s, yellow_duration_s 
cycle_time_s
violations_count
vehicles_involved
veh_count_at_accident '''

plt.scatter(x = df['lane_count'], y = df['speed_limit_kmph'], color = 'blue')

plt.scatter(x = df['speed_limit_kmph'], y = df['blackspot_score'], color = 'red')

plt.scatter(x = df['blackspot_score'], y = df['latitude'], color = 'green')

plt.scatter(x = df['latitude'], y = df['longitude'], color = 'orange')

plt.scatter(x = df['day_of_week'], y = df['hour_of_day'], color = 'purple')

plt.scatter(x = df['vehicle_count_per_hr'], y = df['avg_speed_kmph'], color = 'brown')

plt.scatter(x = df['abg_speed_kmph'], y = df['green_duration_s'], color = 'pink')

plt.scatter(x = df['green_duration_s'], y = df['red_duration_s'], color = 'cyan')

plt.scatter(x = df['red_duration_s'], y = df['yellow_duration_s'], color = 'magenta')

plt.scatter(x = df['cycle_time_s'], y = df['violations_count'], color = 'yellow')

plt.scatter(x = df['violation_count'], y = df['vehicles_involved'], color = 'grey')

plt.scatter(x = df['vehicles_involved'], y = df['veh_count_at_accident'], color = 'olive')

plt.scatter(x = df['veh_count_at_accident'], y = df['lane_count'], color = 'teal')


sns.boxplot(x = df["lane_count"], y = df["speed_limit_kmph"])
plt.title("lane_count vs speed_limit_kmph")
plt.show()

sns.violinplot(x = df["lane_count"], y = df["speed_limit_kmph"])
plt.title("lane_count vs speed_limit_kmph")
plt.show()

#### HEAT MAP....................
import seaborn as sns

subset = df[["lane_count", "speed_limit_kmph"]]
sns.heatmap(subset.corr(), annot=True, cmap="coolwarm")

    
plt.figure(figsize=(10,8))
sns.heatmap(df.corr(numeric_only=True), annot=True, cmap="coolwarm")
plt.title("Correlation Heatmap")
plt.show()

###### 3. MULTI VARIATE PLOTS..........................................
#####  PAIR PLOTS...............
numeric_cols = df.select_dtypes(include='number').columns

# Pairplot for multivariate analysis
sns.set(style="ticks", palette="Set2")  # Nice style and color palette
pairplot = sns.pairplot(
    df[numeric_cols],
    diag_kind='kde',      # Kernel density estimate on diagonal
    kind='scatter',       # Scatter plots for off-diagonal
    corner=False,         # Show full matrix (not just lower triangle)
    plot_kws={'alpha':0.6, 's':40}  # Transparency and point size
)
pairplot.fig.suptitle("Pairwise Relationships (Multivariate Analysis)", y=1.02)
plt.show()

#### FOR EVERY COLUMN FOR PAIR PLOTS:-
for i, col in enumerate(numeric_cols):
    
    sns.pairplot(df, y_vars=[col], x_vars=numeric_cols.drop(col), height=4, aspect=1, plot_kws={'color': colors[i%len(colors)]})
    plt.suptitle(f'Pair Plot for {col}', y=1.02)
    plt.show()
    

