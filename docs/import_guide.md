# Guide: Import Data into MySQL

## 1. Create a new database (optional)

```sql
CREATE DATABASE layoffs_db;
USE layoffs_db;
```

## 2. Create the table for raw data

You can use MySQL Workbench or the command line to import the CSV file.

### Option 1: Using MySQL Workbench

1. Right-click your database > Table Data Import Wizard
2. Select `raw_data/layoffs.csv`
3. Follow the wizard; MySQL will auto-detect the columns.

### Option 2: Using SQL commands

```sql
CREATE TABLE layoffs (
    company TEXT,
    location TEXT,
    industry TEXT,
    total_laid_off INT,
    percentage_laid_off TEXT,
    date TEXT,
    stage TEXT,
    country TEXT,
    funds_raised_millions INT
);

LOAD DATA LOCAL INFILE 'path/to/raw_data/layoffs.csv'
INTO TABLE layoffs
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```
**Note:** Replace `'path/to/raw_data/layoffs.csv'` with the actual path on your machine.

## 3. Verify the data

```sql
SELECT * FROM layoffs LIMIT 10;
```

---

If you get import errors due to encoding, make sure your CSV file is saved as UTF-8.
