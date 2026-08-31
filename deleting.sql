-- removing the duplicates  from the above raw dat available 
select *,
row_number() over(partition by company,industry,percentage_laid_off,'date',total_laid_off) as row_no
from layoff_staging;


WITH duplicate_cte AS 
( 
SELECT *, 
ROW_NUMBER() OVER(PARTITION BY company, location, industry, percentage_laid_off, `date`, total_laid_off,funds_raised_millions) AS row_no 
FROM layoff_staging
)
SELECT * 
FROM duplicate_cte 
WHERE row_no > 1;

select *
from layoff_staging
where company = 'Cazoo';

select *
from layoff_staging;


WITH dupllayoffsicate_cte AS 
( 
SELECT *, 
ROW_NUMBER() OVER(PARTITION BY company, location, industry, percentage_laid_off, `date`, total_laid_off,funds_raised_millions) AS row_no 
FROM layoff_staging
)
delete 
FROM duplicate_cte 
WHERE row_no > 1;


CREATE TABLE `layoff_staging2` (
   `company` text,
   `location` text,
   `industry` text,
   `total_laid_off` int DEFAULT NULL,
   `percentage_laid_off` text,
   `date` text,
   `stage` text,
   `country` text,
   `funds_raised_millions` int DEFAULT NULL,
   `row_no` INT 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select *
from layoff_staging2;

insert into layoff_staging2
select *,
row_number() over(partition by company,industry,percentage_laid_off,'date',total_laid_off) as row_no
from layoff_staging;

select *
from layoff_staging2
where row_no > 1;

delete
from layoff_staging2
where row_no > 1;

select *
from layoff_staging2;
