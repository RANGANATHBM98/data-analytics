-- exploratory data analytics
SELECT industry, SUM(total_laid_off)
FROM layoff_staging2
GROUP BY industry
ORDER BY 2 DESC;


SELECT company, SUM(total_laid_off)
FROM layoff_staging2
GROUP BY company
ORDER BY 2 DESC;


SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoff_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;


CREATE TABLE layoff_staging_clean (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` date DEFAULT NULL,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_no` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO layoff_staging_clean (company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions)
SELECT company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
FROM (
    SELECT company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions,
           ROW_NUMBER() OVER(
               PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
           ) AS row_num
    FROM layoff_staging2
) AS deduplicated_data
WHERE row_num = 1;

DROP TABLE layoff_staging2;

RENAME TABLE layoff_staging_clean TO layoff_staging2;

select *
from layoff_staging2;

select company, sum(total_laid_off)
from layoff_staging2
group by company
order by 2 desc;


select min(`date`),max(`date`)
from layoff_staging2;

select industry, sum(total_laid_off)
from layoff_staging2
group by industry
order by 2 desc;

select *
from layoff_staging2;


SELECT year(`date`), SUM(total_laid_off)
FROM layoff_staging2
GROUP BY `date`
ORDER BY 1 DESC;

SELECT stage, SUM(total_laid_off)
FROM layoff_staging2
GROUP BY stage
ORDER BY 1 DESC;

SELECT company, SUM(percentage_laid_off)
FROM layoff_staging2
GROUP BY company
ORDER BY 1 DESC;

SELECT SUBSTRING(`date`, 6, 2) AS `month`, SUM(total_laid_off)
FROM layoff_staging2
where SUBSTRING(`date`, 6, 2) is not null
GROUP BY `month`
order by 1 asc
;

SELECT SUBSTRING(`date`, 1, 7) AS `month`, SUM(total_laid_off)
FROM layoff_staging2
where SUBSTRING(`date`, 1, 7) is not null
GROUP BY `month`
order by 1 asc
;

WITH rolling_total AS (
    SELECT SUBSTRING(`date`, 1, 7) AS `month`, SUM(total_laid_off) AS total_off
    FROM layoff_staging2
    WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
    GROUP BY `month`
    ORDER BY 1 ASC
)
SELECT `month`, total_off,
       SUM(total_off) OVER(ORDER BY `month`) AS rolling_total
FROM rolling_total;

SELECT company, year(`date`) ,SUM(total_laid_off)
FROM layoff_staging2
GROUP BY company, year(`date`)
ORDER BY 3 desc
;

with Company_year (company, years, total_laid_off) as
(
SELECT company, year(`date`) ,SUM(total_laid_off)
FROM layoff_staging2
GROUP BY company, year(`date`)
)
select *
from Company_year;

-- who laid most people year 
WITH Company_year (company, years, total_laid_off) AS
(
    SELECT company, YEAR(`date`), SUM(total_laid_off)
    FROM layoff_staging2
    GROUP BY company, YEAR(`date`)
),
Company_Year_Rank AS (
    SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
    FROM Company_year
    WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5;




