-- Exploratory Data Analysis (EDA) - Layoffs Dataset
-- Author: nmdattt
-- Purpose: Explore patterns, trends, and statistics in the cleaned layoffs data.

-- ==========================================
-- 0. View the Cleaned Data
-- ==========================================

SELECT *
FROM layoffs_staging2;

-- ==========================================
-- 1. Summary Statistics
-- ==========================================

-- 1.1. Maximum total laid off and maximum percentage laid off
SELECT
    MAX(total_laid_off) AS max_total_laid_off,
    MAX(percentage_laid_off) AS max_percentage_laid_off
FROM layoffs_staging2;

-- 1.2. All records where 100% of employees were laid off, ordered by funds raised
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- 1.3. Total layoffs by company (descending)
SELECT
    company,
    SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY company
ORDER BY total_laid_off DESC;

-- 1.4. Earliest and latest layoff dates
SELECT
    MIN(`date`) AS min_date,
    MAX(`date`) AS max_date
FROM layoffs_staging2;

-- ==========================================
-- 2. Aggregation by Category
-- ==========================================

-- 2.1. Total layoffs by industry
SELECT
    industry,
    SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY industry
ORDER BY total_laid_off DESC;

-- 2.2. Total layoffs by country
SELECT
    country,
    SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY country
ORDER BY total_laid_off DESC;

-- 2.3. Total layoffs by year
SELECT
    YEAR(`date`) AS year,
    SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY year
ORDER BY year DESC;

-- 2.4. Total layoffs by stage
SELECT
    stage,
    SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY stage
ORDER BY total_laid_off DESC;

-- 2.5. Average percentage laid off by company
SELECT
    company,
    AVG(percentage_laid_off) AS avg_percentage_laid_off
FROM layoffs_staging2
GROUP BY company
ORDER BY avg_percentage_laid_off DESC;

-- ==========================================
-- 3. Time Series Analysis
-- ==========================================

-- 3.1. Total layoffs by month
SELECT
    DATE_FORMAT(`date`, '%Y-%m') AS month,
    SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
WHERE `date` IS NOT NULL
GROUP BY month
ORDER BY month ASC;

-- 3.2. Rolling total layoffs by month
WITH Rolling_Total AS (
    SELECT
        DATE_FORMAT(`date`, '%Y-%m') AS month,
        SUM(total_laid_off) AS total_off
    FROM layoffs_staging2
    WHERE `date` IS NOT NULL
    GROUP BY month
    ORDER BY month ASC
)
SELECT
    month,
    total_off,
    SUM(total_off) OVER (ORDER BY month) AS rolling_total
FROM Rolling_Total;

-- ==========================================
-- 4. Top Companies Each Year
-- ==========================================

-- 4.1. Top 5 companies by total layoffs for each year
WITH Company_Year AS (
    SELECT
        company,
        YEAR(`date`) AS years,
        SUM(total_laid_off) AS total_laid_off
    FROM layoffs_staging2
    GROUP BY company, years
), Company_Year_Rank AS (
    SELECT
        *,
        DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
    FROM Company_Year
    WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE ranking <= 5;
