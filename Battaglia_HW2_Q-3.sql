--QUESTION 3(a):Find the orders shipped to Poland and those to Portugal. 
--Display the order id (heading: Order Number), customer country (heading: Customer Country; note may not be the shipping country), 
--and Employee Name (Title + first name + last name; as in the previous homework question).
select x.orderid as "Order Number", y.country as "Customer Country", 
e.titleofcourtesy || ' ' ||e.firstname || ' ' || e.lastname as "Employee Name"
from corp.orders x, corp.customers y, corp.employees e
where e.employeeid = x.employeeid
and y.custid = x.custid
and x.shipcountry in( 'Poland','Portugal');

--OUTPUT:

Order Number Customer Country Employee Name                                           
------------ ---------------- ---------------------------------------------------------
       10963 Portugal         Ms. Anne Dodsworth                                        
       10491 Portugal         Mr. Abel Bossini                                          
       10328 Portugal         Mrs. Margaret Peacock                                     
       10551 Portugal         Mrs. Margaret Peacock                                     
       10464 Portugal         Mrs. Margaret Peacock                                     
       10352 Portugal         Ms. Janet Leverling                                       
       10664 Portugal         Ms. Nancy Davolio                                         
       10604 Portugal         Ms. Nancy Davolio                                         
       11007 Portugal         Mr. Abel Bossini                                          
       10336 Portugal         Mr. Robert King                                           
       10477 Portugal         Mr. Steven Buchanan                                       
       10397 Portugal         Mr. Steven Buchanan                                       
       10433 Portugal         Ms. Janet Leverling                                       
       10998 Poland           Mr. Abel Bossini                                          
       10611 Poland           Mr. Michael Suyama                                        
       10870 Poland           Mr. Steven Buchanan                                       
       10906 Poland           Mrs. Margaret Peacock                                     
       11044 Poland           Mrs. Margaret Peacock                                     
       10374 Poland           Ms. Nancy Davolio                                         
       10792 Poland           Ms. Nancy Davolio                                         

 20 rows selected

--EXPLANATION: This is a simple select on three tables. I JOIN orders, customers and employees
--on employeeid and custid. There is a resttiction to apply for Poland and Portugal. I did not use
--a LIKE on 'Po%' as other countries beginning with 'Po' may exist. The query operates by 



--****************************************************************************************************
--QUESTION 3(b): Next: add columns to show the ID, last name and title of the supervising employee 
--(i.e., the person each employee displayed in the previous part reports to). 
--Use the following headings: Manager ID, Manager LName, Mgr Title. Manager Title is their job title (e.g., Vice President)
select x.orderid as "Order Number", y.country as "Customer Country", 
e.titleofcourtesy || ' ' ||e.firstname || ' ' || e.lastname as "Employee Name",
e2.title, e2.firstname || ' ' || e2.lastname as "Manager Name"
from corp.orders x, corp.customers y, corp.employees e, corp.employees e2
where e.employeeid = x.employeeid
and y.custid = x.custid
and x.shipcountry in( 'Poland','Portugal')
and e2.employeeid = e.reportsto;

--OUTPUT:

Order Number Customer Country Employee Name                                             TITLE                          Manager Name                  
------------ ---------------- --------------------------------------------------------- ------------------------------ -------------------------------
       10604 Portugal         Ms. Nancy Davolio                                         Vice President, Sales          Andrew Fuller                   
       10963 Portugal         Ms. Anne Dodsworth                                        Sales Manager                  Steven Buchanan                 
       10664 Portugal         Ms. Nancy Davolio                                         Vice President, Sales          Andrew Fuller                   
       10491 Portugal         Mr. Abel Bossini                                          Sales Manager                  Steven Buchanan                 
       10464 Portugal         Mrs. Margaret Peacock                                     Vice President, Sales          Andrew Fuller                   
       10352 Portugal         Ms. Janet Leverling                                       Vice President, Sales          Andrew Fuller                   
       10328 Portugal         Mrs. Margaret Peacock                                     Vice President, Sales          Andrew Fuller                   
       10551 Portugal         Mrs. Margaret Peacock                                     Vice President, Sales          Andrew Fuller                   
       11007 Portugal         Mr. Abel Bossini                                          Sales Manager                  Steven Buchanan                 
       10477 Portugal         Mr. Steven Buchanan                                       Vice President, Sales          Andrew Fuller                   
       10433 Portugal         Ms. Janet Leverling                                       Vice President, Sales          Andrew Fuller                   
       10397 Portugal         Mr. Steven Buchanan                                       Vice President, Sales          Andrew Fuller                   
       10336 Portugal         Mr. Robert King                                           Sales Manager                  Steven Buchanan                 
       10611 Poland           Mr. Michael Suyama                                        Sales Manager                  Steven Buchanan                 
       10870 Poland           Mr. Steven Buchanan                                       Vice President, Sales          Andrew Fuller                   
       10792 Poland           Ms. Nancy Davolio                                         Vice President, Sales          Andrew Fuller                   
       10998 Poland           Mr. Abel Bossini                                          Sales Manager                  Steven Buchanan                 
       11044 Poland           Mrs. Margaret Peacock                                     Vice President, Sales          Andrew Fuller                   
       10906 Poland           Mrs. Margaret Peacock                                     Vice President, Sales          Andrew Fuller                   
       10374 Poland           Ms. Nancy Davolio                                         Vice President, Sales          Andrew Fuller                   

 20 rows selected  

--EXPLANATION: This query required the use of a temporary view of employees e2 that could be used to JOIN
--employees on employees using the reportsto ON employeeid.

