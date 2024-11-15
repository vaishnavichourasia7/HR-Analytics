use excelr;

#1, Average Attrition rate for all Departments

select department,concat(round(count(case when attrition = "Yes" then 1 end) *100/count(*),2),"%") as Attrition_Rate from hr 
group by department 
order by attrition_Rate desc;

#2, Average Hourly rate of Male Research Scientist

select avg(`hourly rate`) as Avg_Hourly_rate_Male_Research_Scientist from hr where gender ="Male" and `job role` = "Research Scientist";

#3, Attrition rate Vs Monthly income stats

select case
       when `monthly income` between 1000 and 15000 then "1K-15K"
       when `monthly income` between 15001 and 30000 then "15k-30k"
       when `monthly income` between 30001 and 51000 then "30k- 51k"
       end as Income_Range,
       count(case when Attrition = "Yes" then 1 end)*100/count(*) as Attrition_Rate , 
       count(case when Attrition = "Yes" then 1 end) as Attrition
from hr group by case
       when `monthly income` between 1000 and 15000 then "1K-15K"
       when `monthly income` between 15001 and 30000 then "15k-30k"
       when `monthly income` between 30001 and 51000 then "30k- 51k"
       end; 


select Attrition, avg(`monthly income`) Avg_Incone from hr group by attrition;


select `Job Role`,concat(round(count(case when attrition = "Yes" then 1 end) *100/count(*),2),"%") as Attrition_Rate, round(avg(`monthly income`),2) Avg_Monthly_Income
 from hr 
group by `Job role` 
order by attrition_Rate desc;


#4, Average working years for each Department

select department,avg(`Total working years`) Avg_Working_Years from hr group by department;

#5, Job Role Vs Work life balance

select `job role`,round(avg(`work life balance`),2) Avg_W_L_B from hr group by `job role`;

#6, Attrition rate Vs Year since last promotion relation

SELECT
    CASE
        WHEN `Years Since Last Promotion` BETWEEN 0 AND 4 THEN '0-4 Years'
        WHEN `Years Since Last Promotion` BETWEEN 5 AND 9 THEN '5-9 Years'
        WHEN `Years Since Last Promotion` > 9 THEN '10+ Years'
        ELSE 'Unknown'
    END AS Promotion_Interval,count(CASE WHEN Attrition = 'Yes' THEN 1 END) Attrition,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS Attrition_Rate
FROM
    HR
GROUP BY
    CASE
        WHEN `Years Since Last Promotion` BETWEEN 0 AND 4 THEN '0-4 Years'
        WHEN `Years Since Last Promotion` BETWEEN 5 AND 9 THEN '5-9 Years'
        WHEN `Years Since Last Promotion` > 9 THEN '10+ Years'
        ELSE 'Unknown'
    END
ORDER BY
    Promotion_Interval;
