# 2021ASP59
# Breast Cancer Classification Using Machine Learning in R

## 1. Project Overview

This project focuses on developing a Machine Learning model to classify breast cancer tumours as **Benign** or **Malignant** using the R programming language.

The project applies data preprocessing, Exploratory Data Analysis (EDA), and the Random Forest classification algorithm to predict breast cancer diagnosis.

## 2. Objectives

- Analyse breast cancer data.
- Perform data cleaning and preprocessing.
- Explore data using visualization techniques.
- Develop a Random Forest classification model.
- Evaluate model performance using classification metrics.
- Identify important features influencing predictions.

## 3. Dataset Description

The dataset contains 569 records with 32 columns, including patient IDs, diagnosis labels, and tumour measurements.

**Diagnosis Distribution:**

| Diagnosis | Records |
|---|---:|
| Benign | 357 |
| Malignant | 212 |
| Total | 569 |

The dataset includes tumour measurements such as radius, texture, perimeter, area, smoothness, compactness, concavity, and symmetry.

## 4. Technologies Used

- R Programming Language
- RStudio
- Random Forest
- ggplot2
- corrplot

## 5. Project Methodology

The project follows these steps:

1. Dataset Import
2. Data Cleaning and Preprocessing
3. Exploratory Data Analysis (EDA)
4. Data Visualization
5. Random Forest Model Training
6. Prediction and Classification
7. Model Evaluation
8. Feature Importance Analysis

## 6. Exploratory Data Analysis

The following visualizations were created:

- Diagnosis Distribution Bar Chart
- Tumour Radius Boxplot
- Tumour Measurement Correlation Heatmap

All visualization files are stored in the `figures/` directory.

## 7. Machine Learning Model

The Random Forest algorithm was used for breast cancer classification.

- Algorithm: Random Forest
- Number of Trees: 500
- Target Variable: Diagnosis
- Classification Classes: Benign and Malignant

## 8. Model Performance

The model achieved the following evaluation results:

| Evaluation Metric | Result |
|---|---:|
| Accuracy | 98.26% |
| Sensitivity | 100% |
| Specificity | 97.22% |

These results demonstrate strong classification performance on the test dataset.

## 9. Project Structure

```text
2021ASP59/
│
├── code/
├── data/
├── figures/
├── output/
├── .gitignore
├── 2021ASP59.Rproj
└── README.md
```

## 10. How to Run the Project

1. Install R and RStudio.
2. Clone or download this repository.
3. Open the `2021ASP59.Rproj` file in RStudio.
4. Install the required R packages.
5. Open and execute the R scripts in the `code/` directory.

## 11. Conclusion

This project demonstrates the application of Machine Learning techniques for breast cancer classification using R.

The Random Forest model achieved 98.26% accuracy, showing promising results in distinguishing between benign and malignant tumours.

---

**Student ID:** 2021ASP59  
**Project:** Breast Cancer Classification Using Machine Learning in R