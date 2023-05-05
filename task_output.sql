select *,
	sum(marks) over(partition by Student_no ) Student_Total
   ,cast(round(cast(marks as decimal(18,2))/sum(marks) over(partition by Student_no )*100) as varchar)||'%' "Student%"
   ,sum(marks) over ()Class_Total
   ,cast(round(sum(cast(marks as decimal(18,2))) over(partition by Student_no )/sum(marks)over()*100) as varchar) ||'%' "Class%"
from 
(select  1 Student_no,'M'  Male ,100	Marks union all
	select 1,'P',100   union all
	select 1,'C',100   union all
	select 2,'M',90   union all
	select 2,'P',100   union all
	select 2,'C',80   union all
	select 3,'M',90   union all
	select 3,'P',80   union all
	select 3,'C',70   union all
	select 4,'M',60   union all
	select 4,'P',70   union all
	select 4,'C',80   
) group by 1,2,3 order by 1



Student_no	Male	Marks	Student_Total	Student%	Class_Total	Class%
1	P	100	300	33%	1020	29%
1	C	100	300	33%	1020	29%
1	M	100	300	33%	1020	29%
2	C	80	270	30%	1020	26%
2	P	100	270	37%	1020	26%
2	M	90	270	33%	1020	26%
3	M	90	240	38%	1020	24%
3	P	80	240	33%	1020	24%
3	C	70	240	29%	1020	24%
4	M	60	210	29%	1020	21%
4	P	70	210	33%	1020	21%
4	C	80	210	38%	1020	21%
