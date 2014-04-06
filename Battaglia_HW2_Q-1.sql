--QUESTION 1(a):For the employees who are not from USA, 
--show the Employee name (first and last name concatenated together as "John Doe", heading: Employee Name),
--Country (heading: Country), birthdate (heading: Birthday Date).
select corp.employees.firstname || ' ' || corp.employees.lastname as "Employee Name", 
corp.employees.country as "Country", birthdate as "Birthday Date"
from corp.employees 
where corp.employees.country <> 'USA';

--OUTPUT:
Employee Name                   Country         Birthday Date
------------------------------- --------------- -------------
Steven Buchanan                 UK              04-MAR-65     
Michael Suyama                  UK              02-JUL-73     
Robert King                     UK              29-MAY-70     
Anne Dodsworth                  UK              02-JUL-79 

--EXPLANATION: This is a very simple SELECT on one table. The query leverages concatenation
--to display a readable name, and it applies criteria in the WHERE clause to give non-USA
--employees. This is done using the not-equals <> operator. To be more thorough, I could have forced
--the comparisons to use the UPPER() function in the event that inconstistencies existed in the data.


--*****************************************************************************************************
--QUESTION 1(b):Modify the previous query to show only those employees who have extension numbers of length three. 
--Also show their extension numbers (heading: Extension Number).
select corp.employees.firstname || ' ' || corp.employees.lastname as "Employee Name", 
corp.employees.country as "Country", birthdate as "Birthday Date",
corp.employees.extension as "Extension Number"
from corp.employees 
where corp.employees.country <> 'USA'
and trim(length(extension)) = 3;

--OUTPUT:
Employee Name                   Country         Birthday Date Extension Number
------------------------------- --------------- ------------- ----------------
Michael Suyama                  UK              02-JUL-73     428              
Robert King                     UK              29-MAY-70     465              
Anne Dodsworth                  UK              02-JUL-79     452


--EXPLANATION: Same query as far as SELECT is concerned. There is a new column added
--with a restriction applied to its values. This is done by using the TRIM() function
--to ensure that there were no spaces in the field. Then, the LENGTH function is applied
--to the data in the extension column.


--*****************************************************************************************************
--QUESTION 1(c):Sort the results on basis of Employee name (ascending). 
--Ensure your query will never show employees who don’t have a country saved for them.
select corp.employees.firstname || ' ' || corp.employees.lastname as "Employee Name", 
corp.employees.country as "Country", birthdate as "Birthday Date",
corp.employees.extension as "Extension Number"
from corp.employees 
where corp.employees.country is not null
and corp.employees.country <> 'USA'
and trim(length(extension)) = 3
order by "Employee Name" asc;

--OUTPUT:
Employee Name                   Country         Birthday Date Extension Number
------------------------------- --------------- ------------- ----------------
Anne Dodsworth                  UK              02-JUL-79     452              
Michael Suyama                  UK              02-JUL-73     428              
Robert King                     UK              29-MAY-70     465

--EXPLANATION: This is the same exact query as above with sorting applied using
--ORDER BY on the concatenated column, "Employee Name". 