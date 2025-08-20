-- Data Cleaning in MySQL - Layoffs Dataset
-- Author: nmdattt
-- Purpose: Clean the layoffs dataset by removing duplicates, standardizing values, handling missing data, and formatting columns.

-- ==========================================
-- 0. Prepare the staging table
-- ==========================================

-- Create a temporary table for data processing
CREATE TABLE layoffs_staging LIKE layoffs;

-- Insert data into the staging table
INSERT INTO layoffs_staging
SELECT *
FROM layoffs;

-- ==========================================
-- 1. Remove duplicate records
-- ==========================================

-- Create staging2 table and add a row_num column to identify duplicates
CREATE TABLE layoffs_staging2 (
  company TEXT,
  location TEXT,
  industry TEXT,
  total_laid_off INT DEFAULT NULL,
  percentage_laid_off TEXT,
  date TEXT,
  stage TEXT,
  country TEXT,
  funds_raised_millions INT DEFAULT NULL,
  row_num INT
);

-- Insert data into layoffs_staging2 and assign row numbers to duplicates based on key fields
INSERT INTO layoffs_staging2
SELECT *,
    ROW_NUMBER() OVER (
        PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions
        ORDER BY company
    ) AS row_num
FROM layoffs_staging;

-- Delete duplicate records (row_num > 1)
DELETE FROM layoffs_staging2
WHERE row_num > 1;

-- ==========================================
-- 2. Standardize the data
-- ==========================================

-- 2.1. Trim extra spaces from company names
UPDATE layoffs_staging2
SET company = TRIM(company);

-- 2.2. Standardize 'Crypto' industry (handle variations)
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- 2.3. Remove trailing dots from country names
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- 2.4. Convert date strings to DATE type
UPDATE layoffs_staging2
SET date = STR_TO_DATE(date, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN date DATE;

-- ==========================================
-- 3. Handle missing or blank data
-- ==========================================

-- Set NULL for empty industry values
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

-- Fill in missing industry values if another entry with the same company-location has industry info
UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2 ON t1.company = t2.company
                        AND t1.location = t2.location
SET t1.industry = t2.industry
WHERE t1.industry IS NULL AND t2.industry IS NOT NULL;

-- ==========================================
-- 4. Remove unnecessary columns
-- ==========================================

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

-- ==========================================
-- 5. (Optional) View the cleaned data
-- ==========================================

SELECT * FROM layoffs_staging2;