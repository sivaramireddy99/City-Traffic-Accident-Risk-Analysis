# 📊 CITY TRAFFIC ACCIDENT RISK ANALYSIS

## 📌 Project Overview

This project follows a structured Data Analytics lifecycle from business understanding to dashboard development and final presentation. The objective is to transform raw data into meaningful insights that support data-driven decision-making.

---

# 1️⃣ Understanding the Business Problem

### Problem Statement
The City Traffic Department faces a high number of road accidents at intersections and highways due to unpredictable traffic conditions, poorly timed signals, and road infrastructure issues. There is no existing system to proactively identify accident-prone locations.

Business Objective

Identify accident patterns and high-risk zones to improve road safety and support data-driven traffic management decisions.

Business Constraint

Ensure accurate interpretation of accident data while minimizing misleading conclusions caused by incomplete or inconsistent records.

Success Criteria
Reduce accidents in identified high-risk zones by at least 20%.
Improve traffic management planning through analytical insights.
Support emergency response optimization.


### Expected Outcomes

* Improved business performance.
* Data-driven recommendations.
* Interactive reporting dashboards.

---

# 2️⃣ Project Charter

## Project Title

**[CITY TRAFFIC ACCIDENT RISK ANALYSIS]**

## Project Goal

Analyze city traffic accident data using Python, SQL, and Power BI to identify accident hotspots, uncover contributing factors, and develop an interactive dashboard for risk monitoring.

## Scope

### In Scope

* Data Collection
* Data Cleaning
* Exploratory Data Analysis
* SQL Analysis
* Dashboard Development
* Presentation Preparation

### Out of Scope

* Real-time data integration
* Machine Learning deployment

## Stakeholders

* Business Team
* Management Team
* Data Analyst
* End Users

## Success Criteria

* Accurate analysis
* Interactive dashboard delivery
* Actionable business insights

---

# 3️⃣ Data Analytics Checklist

## Business Understanding

* [x] Problem Identification
* [x] Requirement Gathering
* [x] KPI Definition

## Data Understanding

* [x] Data Collection
* [x] Data Inspection
* [x] Data Validation

## Data Preparation

* [x] Missing Value Treatment
* [x] Duplicate Removal
* [x] Outlier Detection
* [x] Data Transformation

## Analysis

* [x] Statistical Analysis
* [x] SQL Queries
* [x] Trend Analysis

## Visualization

* [x] Power BI Dashboard
* [x] KPI Cards
* [x] Interactive Filters

## Reporting

* [x] Insights Generation
* [x] Recommendations
* [x] Final Presentation

---

# 4️⃣ Research Papers

The following research papers/articles were reviewed to understand the domain and analytical approaches:

S.No	Research Article URL	Business Problem	Data set used & variable used	Download Data (If available)	Solution approach	Any interesting insights
1	https://link.springer.com/article/10.1007/s00779-020-01442-y	Urban traffic accident risk using data-driven models to improve road safety and support mobile guidance systems	4,470 traffic accident cases (Seoul, Aug–Dec 2018) with static road features (e.g., road length, speed limit) and dynamic features (traffic volume, sun altitude/azimuth).	Not publicly available	Deep learning model integrating static and dynamic traffic/environmental features for accident risk prediction	The model achieved ~75% accuracy and ~81% recall, indicating deep learning can effectively capture complex accident risk patterns beyond traditional statistical models
2	https://ieeexplore.ieee.org/abstract/document/9652050	Fine- and coarse-grained urban traffic accident risk using spatio-temporal features to aid proactive traffic safety management	Two large real-world traffic accident datasets with historical accident counts and contextual features (e.g., weather, POI, road network)	Not provided publicly	Multi-View Multi-Task Spatio-Temporal Networks (MVMT-STN) that jointly predicts both fine- and coarse-grained accident risks by learning complex spatio-temporal correlations.	Joint multi-task learning across different spatial resolutions significantly boosts prediction performance versus single-task models.
3	https://dl.acm.org/doi/abs/10.1145/3627673.3679567	Urban traffic accident risk by modeling region-level spatio-temporal patterns to support proactive road-safety planning.	Two real-world city-region datasets (e.g., NYC and Chicago) with region identifiers, time, POIs, weather, flow metrics, and remote sensing features.	NA	A multi-granularity hierarchical spatio-temporal network (MGHSTN) capturing regional background, proximity, similarity, and sparsity for risk prediction.	Incorporating remote sensing and hierarchical learning improves prediction robustness over baseline deep models.
4	https://www.mdpi.com/2071-1050/15/4/3748	Short-term urban traffic accident risk to improve proactive traffic safety management and reduce accidents.	Historical traffic accident data from Yinzhou District, Ningbo City, represented as grid images of accident counts (no detailed public list of variables).	Dataset isn’t publicly	A deep learning model (BCDU-Net: bi-directional ConvLSTM U-Net with dense convolutions) to extract spatio-temporal features from grid-based accident data.	BCDU-Net outperformed other models across motor vehicle, non-motor vehicle, and single-vehicle accident prediction experiments
5	https://www.sciencedirect.com/science/article/abs/pii/S0968090X15000947	Real-time traffic accident risk by selecting the most relevant variables to support proactive road-traffic safety systems.	Historical traffic accident dataset with continuous traffic metrics (e.g., traffic speed, traffic volume) and categorical features; key variables chosen via frequent pattern mining.	NA	Frequent pattern tree (FP-tree) based variable selection combined with a Bayesian network model for real-time accident risk prediction.	The FP-tree approach can identify influential patterns but showed moderate prediction performance, highlighting trade-offs between pattern complexity and risk detection accuracy.
6	https://www.mdpi.com/2220-9964/12/12/496	Urban traffic accident risk by integrating spatial context and visual landscape effects to improve prediction accuracy.	Self-made Chicago traffic accident dataset with historical accident counts, spatial adjacency, street view/landscape similarity, and temporal features.	Not publicly available	Enhanced spatial–temporal graph convolutional network combining CNN, GRU, and additional GCN layers to capture spatial, visual, and temporal correlations.	Incorporating city landscape similarity improves prediction performance, especially during high-frequency accident periods.
7	https://www.emerald.com/jtran/article/170/5/245/447923	Review and synthesize existing traffic accident prediction models (APMs) and crash modification factors (CMFs) to support road safety decision-making and intervention strategies.	Not a new data study — synthesizes many existing studies with variables like traffic flow, road geometry, weather, and driver behaviours from past APM/CMF research.	No original dataset	Structured literature review and survey of National Road Authorities to compile and assess modelling approaches, data needs, and predictive performance in APMs and CMFs.	The review produced an APM & CMF inventory repository to help practitioners choose and apply suitable predictive safety models
8	https://ieeexplore.ieee.org/abstract/document/8621000	Road-traffic accident risk in real-time to improve proactive safety and reduce crashes.	Historical accident records with features like time, location, weather, traffic flow, and road attributes.	NA	Machine learning model (e.g., deep learning / spatio-temporal networks) that learns patterns from multi-source traffic and contextual features.	Models combining spatial and temporal features significantly outperform traditional statistical approaches, highlighting the value of deep learning for capturing complex risk patterns.
9	https://www.sciencedirect.com/science/article/abs/pii/S0022437502000336	Estimate and assess traffic accident risk in a given area to support safety planning and resource allocation.	Historical traffic accident counts with influencing factors such as time, location, and traffic/road conditions (specific variables not fully listed in abstract).	Not publicly available	Develops a risk-assessing algorithm that predicts accident occurrence numbers based on historical patterns.	The proposed algorithm quantifies risk level instead of just predicting occurrence, helping prioritize high-risk zones for intervention
10	https://onlinelibrary.wiley.com/doi/full/10.1155/2023/6643412	Review and compare various accident prediction techniques to improve road safety and reduce traffic congestion globally, especially contrasting low-income vs high-income country challenges.	It doesn’t use a specific dataset; rather it surveys literature covering models using variables like traffic counts, weather, road characteristics, and socioeconomic factors.	NA	Literature analysis of prediction methods including logistic regression, decision trees, random forest, SVM, deep neural networks, and geospatial/optimization methods.	It highlights that machine learning and spatial analysis methods show promise for accident prediction but gaps remain in real-world deployment and adaptation across diverse income settings
<img width="3498" height="273" alt="image" src="https://github.com/user-attachments/assets/06f0c2e3-4a37-4248-ab3f-3a0b2a89b8ba" />


### Key Learnings

* Identified industry trends.
* Understood analytical methodologies.
* Validated business assumptions.

---

# 5️⃣ Project Architecture

```text
Client / Data Sources
        │
        ▼
 Data Collection
        │
        ▼
  Data Ingestion
        │
        ▼
 Database Storage
(SQL Server / Azure / PostgreSQL)
        │
        ▼
   Python EDA
        │
        ├──────────────► Statistical Insights
        │                Before Preprocessing
        │
        ▼
 Data Preprocessing
   & Auto Cleaning
        │
        ▼
    Cleaned Data
        │
        ├──────────────► Statistical Insights
        │                After Preprocessing
        │
        ▼
  Comparison Analysis
 (Before vs After)
        │
        ▼
     GenAI Insights
        │
        ▼
   Stakeholder Review
        │
        ▼
 Dashboard Development
        │
        ▼
 Deployment to Client
```

### Technology Stack

| Tool       | Purpose               |
| ---------- | --------------------- |
| Python     | Data Cleaning & EDA   |
| SQL        | Data Querying         |
| Power BI   | Dashboard Development |
| Excel      | Initial Data Review   |
| PowerPoint | Final Presentation    |

---

# 6️⃣ Categorize the Scale of Given Data

## Dataset Characteristics

| Metric            | Value      |
| ----------------- | ---------- |
| Number of Rows    | 100000       |
| Number of Columns | 16          |
| Data Size         | 24 MB/GB   |
| Data Type         | Structured |

## Data Scale Classification

| Scale       | Records   |
| ----------- | --------- |
| Small Data  | < 100K    |
| Medium Data | 100K - 1M |
| Large Data  | > 1M      |

**Dataset Category:** Medium / Large / Small Data

---

# 7️⃣ Exploratory Data Analysis (EDA) Using Python and SQL

## Python Analysis

### Libraries Used

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
```

### EDA Steps

* Data Loading
* Data Inspection
* Missing Value Analysis
* Duplicate Detection
* Outlier Analysis
* Univariate Analysis
* Bivariate Analysis
* Correlation Analysis

### Sample Python Outputs

* Distribution Plots
* Boxplots
* Heatmaps
* Trend Analysis

---

## SQL Analysis

### SQL Operations Performed

```sql
SELECT *
FROM table_name;
```

```sql
SELECT category,
COUNT(*) AS total_records
FROM table_name
GROUP BY category;
```

### SQL Analysis Areas

* Aggregations
* Group By Analysis
* Joins
* Window Functions
* KPI Calculations

---

# 8️⃣ Power BI Visualization

## Dashboard Features

### Executive Summary Dashboard

* KPI Cards
* Business Overview
* Performance Metrics

### Analysis Dashboard

* Trends
* Comparisons
* Filters

### Interactive Features

* Slicers
* Drill-through
* Tooltips
* Dynamic Visuals

## Dashboard KPIs

* Total Records
* Revenue / Sales
* Growth Rate
* Category Performance
* Risk Indicators

## Power BI Components Used

* Cards
* Bar Charts
* Line Charts
* Pie Charts
* Maps
* Matrix Tables

---

# 9️⃣ Presentation (PPT)

## Presentation Structure

### Slide 1

Project Introduction

### Slide 2

Contents

### Slide 3

Business Problem

### Slide 4

Project Overview and Scope

### Slide 5

Project Architecture - Data Workflow

### Slide 6

Data Dictionary

### Slide 7

EDA[Exploratory Data Analysis]

### Slide 8

EDA[Statistical Insights BEFORE AND AFTER]

### Slide 9

Data Processing

### Slide 10

Data Visulization Using Power BI

### Slide 11

Conclusion

---

# 📈 Key Insights

* Insight 1
* Insight 2
* Insight 3
* Insight 4

---

# 💡 Recommendations

* Recommendation 1
* Recommendation 2
* Recommendation 3

---

# 🚀 Future Enhancements

* Predictive Analytics
* Machine Learning Models
* Real-Time Dashboard Integration
* Automated Reporting

---

# 👨‍💻 Author

**SIVA RAMI REDDY**

Data Analyst | Python | SQL | Power BI  | EDA  | Gen AI  

---

# ⭐ Project Status

✅ Completed

---

# 📂 Repository Structure

```text
Project/
│
├── Dataset/
├── Python_EDA/
├── SQL/
├── PowerBI/
├── PPT/
├── Research_Papers/
├── Documentation/
└── README.md
```
