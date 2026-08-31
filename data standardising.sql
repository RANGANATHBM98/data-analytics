-- standardising data

select company, trim(company)
from layoff_staging2;

update layoff_staging2
set company = trim(company);

select distinct industry
from layoff_staging2;


update layoff_staging2
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct country
from layoff_staging2
order by 1;

select distinct country
from layoff_staging2
where country like 'united states'
order by 1;

select distinct country, trim(trailing '.' from country)
from layoff_staging2
order by 1;

update layoff_staging2
set country = trim(trailing '.' from country)
where country like "United States%";

select * 
from layoff_staging2;

SELECT `date`,
       STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoff_staging2;

UPDATE layoff_staging2 
SET `date` = STR_TO_DATE(`date`, '%Y-%m-%d');

alter table layoff_staging2
modify column `date` date;

select *
from layoff_staging2;