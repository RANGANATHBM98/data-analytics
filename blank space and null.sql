-- null or the blank values
select *
from layoff_staging2;

select *
from layoff_staging2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoff_staging2
where industry is null 
or industry = '';

select *
from layoff_staging2
where company like 'Bally%';

DELETE FROM layoff_staging2 
WHERE row_no > 1;

select *
from layoff_staging2;


select *
from layoff_staging2
where company = 'Airbnb';

select * 
from layoff_staging2 t1
join layoff_staging2 t2
on t1.company = t2.company
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;


select t1.industry, t2.industry
from layoff_staging2 t1
join layoff_staging2 t2
on t1.company = t2.company
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

update layoff_staging2
set industry = null
where industry = '';

update layoff_staging2 t1
join layoff_staging2 t2
on t1.company = t2.company
set t1.industry = t2.industry
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

delete 
from layoff_staging2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoff_staging2;

DESCRIBE layoff_staging;