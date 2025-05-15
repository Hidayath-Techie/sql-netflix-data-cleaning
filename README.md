# sql-netflix-data-cleaning

# 🎬 SQL Data Cleaning Project: Netflix Movies & TV Shows

This project showcases a complete data cleaning workflow using **pure SQL**. The dataset was downloaded from [Kaggle - Netflix Movies and TV Shows](https://www.kaggle.com/datasets/shivamb/netflix-shows).

## 📁 Dataset Info

- **Source:** Kaggle
- **File Name:** netflix_titles.csv
- **Rows:** ~8,800+
- **Columns:** 12
- **Focus:** Movie and TV show metadata from Netflix

## 🧼 Cleaning Steps

### 1. Create Staging Table
- Copied raw data into `netflix_staging` table
- All cleaning operations done on a copy to preserve the original

### 2. Removed Duplicates
- Used `ROW_NUMBER()` with `PARTITION BY title, director, type` etc.
- Deleted exact duplicate entries

### 3. Standardized Data
- Cleaned whitespace, standardized values (e.g., “TV Show”, “TV Shows” → “TV Show”)
- Converted `date_added` from string to proper `DATE` format
- Trimmed extra symbols from columns

### 4. Filled Missing Values
- For missing `country`, filled using other rows with the same title
- Set empty string values as `NULL` for easier analysis

### 5. Removed Irrelevant Rows
- Removed rows with no `title`, `type`, or `date_added`

## ✅ Final Output

Cleaned table: `netflix_staging_clean`

- Consistent formatting  
- No duplicates  
- Proper date types  
- Ready for visualization or analysis

## 🔧 Tools Used

- SQL (MySQL syntax)
- `ROW_NUMBER()`, `STR_TO_DATE()`, `TRIM()`, `UPDATE`, `DELETE`, etc.

## 📊 Ready For

- Movie/TV trend analysis
- Genre frequency dashboards
- Country-wise content availability

## 📌 Notes

This project demonstrates how SQL alone can be used to transform messy raw data into structured and analysis-ready datasets.
