# Data Cleaning in MySQL

## Introduction

This project demonstrates data cleaning using MySQL SQL scripts. The source data (`layoffs.csv`) contains layoff events from global companies. The entire data cleaning process is performed using SQL queries.

## Project Structure

```
.
├── raw_data/
│   └── layoffs.csv
├── sql/
│   └── data_cleaning.sql
├── docs/
│   └── import_guide.md
├── README.md
└── .gitignore
```

- **raw_data/**: Contains the original, unprocessed dataset.
- **sql/**: Contains the MySQL cleaning script.
- **docs/**: Documentation and guides.
- **README.md**: This file.

## Usage Instructions

1. **Import the raw data into MySQL**
    - See detailed instructions in `docs/import_guide.md`.

2. **Run the cleaning script**
    - Open `sql/data_cleaning.sql`
    - Execute each section in order, or run the entire file in MySQL Workbench, DBeaver, or via MySQL CLI.

3. **Check the result**
    - The final cleaned data will be in the table `layoffs_staging2` (after deduplication, standardization, and null handling).

## System Requirements

- MySQL 8.0 or higher (to support window functions like ROW_NUMBER).
- Minimum 2GB RAM (depending on dataset size).

## Author

- https://github.com/nmdattt

---

**README tiếng Việt có ở phía trên.**
