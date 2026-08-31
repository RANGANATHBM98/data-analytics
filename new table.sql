-- data cleaning 

select *
from layoffs;

-- remove duplicate
-- standardise the data 
-- null values or blank values
-- remove any columns

create table layoff_staging
like layoffs;

select *
from layoff_staging;   

insert into layoff_staging
select * 
from layoffs;

select *
from layoff_staging; 

