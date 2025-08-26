# Data Cleaning and Exploratory Data Analysis in MySQL

## Introduction

This project demonstrates data cleaning and exploratory data analysis (EDA) using MySQL SQL scripts. The source data (`layoffs.csv`) contains layoff events from global companies. The project covers both the data cleaning process and initial data exploration, all performed with SQL queries.

## Project Structure

```
.
├── raw_data/
│   └── layoffs.csv
├── sql/
│   ├── data_cleaning.sql
│   └── exploratory_data_analysis.sql
├── docs/
│   └── import_guide.md
└── README.md
```

- **raw_data/**: Contains the original, unprocessed dataset.
- **sql/**: Contains SQL scripts for data cleaning and EDA.
- **docs/**: Documentation and guides.
- **README.md**: This file.

## Included Scripts

- **sql/data_cleaning.sql**: Step-by-step script for cleaning and standardizing the layoffs data.
- **sql/exploratory_data_analysis.sql**: SQL queries for exploratory data analysis (EDA) on the cleaned data.

## Usage Instructions

1. **Import the raw data into MySQL**
    - See detailed instructions in `docs/import_guide.md`.

2. **Run the cleaning script**
    - Open `sql/data_cleaning.sql`.
    - Execute each section in order, or run the entire file in MySQL Workbench, DBeaver, or via MySQL CLI.

3. **Run the exploratory data analysis (EDA) script**
    - Open `sql/exploratory_data_analysis.sql`.
    - Execute the queries to gain insights and summary statistics from the cleaned data.

4. **Check the result**
    - The final cleaned data will be in the table `layoffs_staging2` (after deduplication, standardization, and null handling).
    - All EDA queries are based on the `layoffs_staging2` table.

## System Requirements

- MySQL 8.0 or higher (required for window functions like ROW_NUMBER).
- Minimum 2GB RAM (depending on dataset size).

## Author

- [nmdattt](https://github.com/nmdattt)

---

**Feel free to contribute or open issues for suggestions and improvements.**
