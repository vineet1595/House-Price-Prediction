# 🏘️ Bangalore House Price Prediction

<div align="center">

![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white)
![TensorFlow](https://img.shields.io/badge/TensorFlow-2.x-FF6F00?style=for-the-badge&logo=tensorflow&logoColor=white)
![Scikit-Learn](https://img.shields.io/badge/Scikit--Learn-1.x-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Pandas](https://img.shields.io/badge/Pandas-2.x-150458?style=for-the-badge&logo=pandas&logoColor=white)

<br/>

> **An end-to-end Data Science project** that predicts house prices in Bangalore using SQL, Python, Machine Learning, Deep Learning Neural Networks, and Power BI.
<br/>

| Metric | Score |
|--------|-------|
| 🧠 Neural Network R² | **0.8177 (81.8%)** |
| 📉 Neural Network MAE | **₹21.95 Lakhs** |
| 📊 Dataset Size | **13,320 houses** |
| 📍 Locations Covered | **900+ Bangalore localities** |
| 🏆 Best Model | **Deep Learning Neural Network** |

</div>

---

## 📋 Table of Contents

- [Project Overview](#-project-overview)
- [Dataset](#-dataset)
- [Tech Stack](#-tech-stack)
- [Project Structure](#-project-structure)
- [Model Results](#-model-results)
- [Neural Network Architecture](#-neural-network-architecture)
- [ML Pipeline](#-ml-pipeline)
- [Power BI Dashboards](#-power-bi-dashboards)
- [How to Run](#-how-to-run)
- [Predict Function Usage](#-predict-function-usage)
- [Key Insights](#-key-insights)
- [Project Learnings](#-project-learnings)

---

## 🎯 Project Overview

This project builds a complete house price prediction system for Bangalore, India. Starting from raw CSV data, it covers every stage of a real-world Data Science workflow:

- **Data storage** in MySQL using SQL queries for exploration
- **Data cleaning** — handling missing values, outliers, and text parsing
- **Exploratory Data Analysis** with Python visualizations
- **Feature Engineering** with a reusable Scikit-learn Pipeline
- **Baseline ML models** — Linear Regression and Random Forest
- **Deep Learning** — a Neural Network with TensorFlow/Keras
- **Interactive Dashboards** built in Power BI
- **A working predict function** that takes house details and returns a price

---

## 📂 Dataset

**Source:** `Bengaluru_House_Data.csv`

| Column | Type | Description |
|--------|------|-------------|
| `area_type` | Text | Super built-up / Plot / Built-up / Carpet Area |
| `availability` | Text | Ready to Move / possession date |
| `location` | Text | Locality/area in Bangalore |
| `size` | Text | BHK type e.g. "2 BHK", "3 Bedroom" |
| `society` | Text | Apartment complex name (dropped — 41% missing) |
| `total_sqft` | Text | Total area in sq.ft. (some are ranges like "1000-1200") |
| `bath` | Float | Number of bathrooms |
| `balcony` | Float | Number of balconies |
| `price` ⭐ | Float | **Target — Price in Lakhs (₹)** |

**After cleaning:** 12,985 rows · 9 columns · 0 missing values

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| **Python 3.10+** | Core programming language |
| **MySQL + MySQL Workbench** | Database storage and SQL exploration |
| **Pandas / NumPy** | Data manipulation and cleaning |
| **Matplotlib / Seaborn** | EDA visualizations (9 charts) |
| **Scikit-learn** | ML Pipeline, StandardScaler, OneHotEncoder, baseline models |
| **TensorFlow / Keras** | Deep Learning Neural Network |
| **Joblib** | Saving and loading models |
| **SQLAlchemy + PyMySQL** | Python ↔ MySQL connection |
| **Power BI Desktop** | Interactive business dashboards |

---

## 📁 Project Structure

```
bangalore-house-price-prediction/
│
├── 📓 notebook/
│   ├── Bangalore Prediction.ipynb
│   
│
├── 📊 data/
│   ├── Bengaluru_House_Data.csv          ← raw data
│   ├── bangalore_cleaned.csv             
│   └── model_predictions.csv            
│
├── 🤖 models/
│   ├── preprocessor.pkl                 ← fitted Scikit-learn pipeline
│   ├── lr_model.pkl                     ← Linear Regression
│   ├── rf_model.pkl                     ← Random Forest
│   ├── deep_learning_model.keras        ← Neural Network (best model)
│   └── best_nn_model.keras              ← checkpoint copy
│
├── 📈 charts/
│   ├── price_distribution.png
│   ├── bhk_vs_price.png
│   ├── correlation_heatmap.png
│   ├── top_locations.png
│   ├── price_vs_sqft.png
│   ├── area_type_boxplot.png
│   ├── actual_vs_predicted.png
│   ├── residuals.png
│   ├── lr_coefficients.png
│   ├── training_history.png
│   ├── nn_predictions.png
│   ├── all_models_comparison.png
│   └── final_comparison.png
│
├── 📊 powerbi/
│   ├── Bangalore House Prediction.pbix
│   
│
├── 🗄️ sql/
│   └── setup_queries.sql                
│
├── arrays/
│   ├── X_train_processed.npy
│   ├── X_test_processed.npy
│   ├── y_train.npy
│   └── y_test.npy
│
├── requirements.txt
└── README.md
```

---

## 📊 Model Results

| Model | MAE (Lakhs) | RMSE (Lakhs) | R² Score | Accuracy |
|-------|------------|--------------|----------|----------|
| Linear Regression | ₹30.48 | ₹56.63 | 0.7204 | 72.0% |
| Random Forest | ₹28.45 | ₹58.98 | 0.6966 | 69.7% |
| **Neural Network** ✅ | **₹21.95** | **₹45.72** | **0.8177** | **81.8%** |

> **Neural Network improved MAE by ₹8.53L (27.9% better)** compared to the best baseline model

---

## 🧠 Neural Network Architecture

```
Input Layer       →  904 features (4 numeric + 900 one-hot encoded)
       ↓
Dense(256, ReLU)  →  learns complex patterns from input
BatchNorm         →  stabilizes training
Dropout(30%)      →  prevents overfitting
       ↓
Dense(128, ReLU)  →  learns higher-level patterns
BatchNorm
Dropout(20%)
       ↓
Dense(64, ReLU)   →  refines patterns further
BatchNorm
Dropout(10%)
       ↓
Dense(1)          →  outputs predicted price in Lakhs
```

**Training configuration:**

```python
optimizer    = Adam(learning_rate=0.001)
loss         = MAE
batch_size   = 64
max_epochs   = 300
early_stop   = patience=20, restore_best_weights=True
reduce_lr    = factor=0.5, patience=10
total_params = 274,689
```

---

## ⚙️ ML Pipeline

```
Raw Data (6 columns)
       ↓
ColumnTransformer
  ├── Numeric features  → StandardScaler   → scaled to mean=0, std=1
  │   [total_sqft, bath, balcony, bhk]
  └── Text features     → OneHotEncoder    → binary 0/1 columns
      [area_type, location]
       ↓
Processed Data (~904 columns)
       ↓
Neural Network Model
       ↓
Predicted Price (Lakhs ₹)
```

---

## 📈 Power BI Dashboards

### Dashboard 1 — EDA & Market Analysis
Built from `bangalore_cleaned.csv`

| Visual | Type | Insight |
|--------|------|---------|
| Total Listings / Avg Price / Max Price | KPI Cards | Market overview |
| Average Price by Area Type | Clustered Bar | Plot Area most expensive |
| Listings by BHK | Donut Chart | 2 BHK dominates at 47.9% |
| Top 15 Expensive Locations | Horizontal Bar | Sankey Road avg ₹545L |
| Price Distribution | Histogram | Most houses ₹40L–₹100L |
| Price vs Sqft | Scatter Chart | Strong positive correlation |
| Slicers | Area Type, BHK, Availability | Interactive filtering |

### Dashboard 2 — Model Performance
Built from `model_predictions.csv`

| Visual | Type | Insight |
|--------|------|---------|
| NN / LR / RF MAE Cards | KPI Cards | NN wins at ₹21.95L |
| Actual vs Predicted | Scatter Chart | Tight cluster = good model |
| Error Distribution | Histogram | Bell curve centered at 0 |
| Error by Price Range | Clustered Column | High price homes hardest to predict |
| R² Score Comparison | Bar Chart | NN clearly best at 0.8177 |
| Slicers | Area Type, Price Range, BHK | Interactive filtering |

---

## 🚀 How to Run

### Prerequisites

```bash
pip install pandas numpy matplotlib seaborn scikit-learn tensorflow sqlalchemy pymysql mysql-connector-python joblib
```

### MySQL Setup

```sql
CREATE DATABASE bangalore_project;
USE bangalore_project;
```

### Clone and Run

```bash
# Clone the repository
git clone https://github.com/your-username/bangalore-house-price-prediction.git
cd bangalore-house-price-prediction

# Install dependencies
pip install -r requirements.txt

# Run notebooks in order
jupyter notebook
```

Open notebooks in this order:
1. `Day1_SQL_Exploration.ipynb`
2. `Day2_Data_Cleaning.ipynb`
3. `Day3_EDA_Visualizations.ipynb`
4. `Day4_Feature_Engineering_Pipeline.ipynb`
5. `Day5_Baseline_ML_Models.ipynb`
6. `Day6_Deep_Learning.ipynb`
7. `Day7_Evaluation_Predict_Function.ipynb`

> ⚠️ Update MySQL credentials in each notebook before running:
> ```python
> MYSQL_USER     = "root"
> MYSQL_PASSWORD = "your_password"
> MYSQL_HOST     = "localhost"
> MYSQL_DATABASE = "bangalore_project"
> ```

---

## 🔮 Predict Function Usage

```python
import joblib
import pandas as pd
import tensorflow as tf

# Load saved models
preprocessor = joblib.load('models/preprocessor.pkl')
model        = tf.keras.models.load_model('models/deep_learning_model.keras')

def predict_house_price(area_type, location, total_sqft, bath, balcony, bhk):
    input_data = pd.DataFrame({
        'total_sqft': [total_sqft],
        'bath'      : [bath],
        'balcony'   : [balcony],
        'bhk'       : [bhk],
        'area_type' : [area_type],
        'location'  : [location]
    })
    processed      = preprocessor.transform(input_data)
    predicted_price = model.predict(processed, verbose=0)[0][0]
    return round(float(predicted_price), 2)


# Example predictions
print(predict_house_price("Super built-up  Area", "Whitefield",    1200, 2, 1, 2))
# Output: ₹65.40 Lakhs

print(predict_house_price("Super built-up  Area", "Koramangala",   1800, 3, 2, 3))
# Output: ₹120.80 Lakhs

print(predict_house_price("Built-up  Area",       "Electronic City", 900, 1, 1, 1))
# Output: ₹38.20 Lakhs
```

**Valid values for `area_type`:**
```
"Super built-up  Area"
"Built-up  Area"
"Plot  Area"
"Carpet  Area"
```

---

## 💡 Key Insights

- **`total_sqft`** is the single strongest predictor of house price (correlation: 0.65)
- **Location premium is massive** — same size house in Sankey Road costs 8× more than Electronic City
- **2 BHK and 3 BHK** together account for 86% of all listings in Bangalore
- **Neural Networks outperform** classical ML when there are many one-hot encoded categorical features (900+ location columns)
- **Very high-priced homes (₹400L+)** are hardest to predict accurately — fewer training examples in that range
- **Median price (₹72L) vs mean price (₹97L)** — the gap shows how a few luxury homes skew the average upward

---

## 📚 Project Learnings

```
✅ How to load CSV data into MySQL and write analytical SQL queries
✅ Data cleaning techniques — handling missing values, outliers, text parsing
✅ Building a reusable Scikit-learn preprocessing pipeline
✅ The difference between MAE, RMSE, and R² and when to use each
✅ Why data leakage happens and how to prevent it (never fit on test data)
✅ Building and training a Deep Neural Network with TensorFlow/Keras
✅ Using EarlyStopping, ReduceLROnPlateau, ModelCheckpoint callbacks
✅ What Dropout and BatchNormalization do inside a neural network
✅ How to interpret residual plots and training loss curves
✅ Building interactive Power BI dashboards for business users
```

---

## 📦 Requirements

```
pandas>=2.0.0
numpy>=1.24.0
matplotlib>=3.7.0
seaborn>=0.12.0
scikit-learn>=1.3.0
tensorflow>=2.13.0
sqlalchemy>=2.0.0
pymysql>=1.1.0
mysql-connector-python>=8.0.0
joblib>=1.3.0
jupyter>=1.0.0
```

---

## 🗄️ MySQL Tables Created

| Table Name | Description |
|-----------|-------------|
| `houses` | Raw imported data (13,320 rows) |
| `houses_clean` | Cleaned data (12,985 rows) |
| `houses_split` | Train/test split with labels |
| `model_results` | Final model comparison scores |
| `model_predictions` | Test set with all 3 model predictions |

---

## 👨‍💻 Author

**Vineet**
Data Analyst — Tata Consultancy Services (TCS), Mumbai

- [![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin)](https://linkedin.com/in/vm62)
- [![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?style=for-the-badge&logo=github)](https://github.com/vineet1595)
- Email: vineetm1595@gmail.com

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgements

- Dataset sourced from Kaggle — Bengaluru House Price Data
- TensorFlow/Keras documentation
- Scikit-learn documentation
- Power BI Microsoft documentation

---

<div align="center">

⭐ **If you found this project helpful, please give it a star!** ⭐


</div>
