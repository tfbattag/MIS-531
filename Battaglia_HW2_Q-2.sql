--QUESTION 2(a): Find orders placed between 25 March 2010 and 2 April 2010. 
--Your query should exclude orders that were placed on these two dates mentioned above. 
--Display the Order id with a column heading of: Order Number. 
--Also display the Order Date (heading: Order Date), shipping country (heading: Ship Country). 
--Sort by order date so that the latest order placed is shown first.
select corp.orders.orderid as "Order Number", to_char(corp.orders.orderdate, 'MM/dd/YYYY hh24:mi') as "Order Date", 
corp.employees.employeeid, corp.orders.shipcountry as "Ship Country"
from corp.orders, corp.employees
where corp.orders.employeeid = corp.employees.employeeid
and corp.orders.orderdate between to_date('03/25/2010', 'MM/dd/YYYY')+1 and to_date('04/02/2010 00:00', 'MM/dd/YYYY hh24:mi')-1
order by corp.orders.orderdate desc;  

--OUTPUT:
rder Number Order Date       EMPLOYEEID Ship Country  
------------ ---------------- ---------- ---------------
       10992 04/01/2010 00:00          1 USA             
       10991 04/01/2010 00:00          1 Germany         
       10990 04/01/2010 00:00          2 Austria         
       10993 04/01/2010 00:00          7 Sweden          
       10989 03/31/2010 00:00          2 Brazil          
       10988 03/31/2010 00:00          3 USA             
       10987 03/31/2010 00:00          8 UK              
       10984 03/30/2010 00:00          1 USA             
       10985 03/30/2010 00:00          2 Ireland         
       10986 03/30/2010 00:00          8 Argentina       
       10982 03/27/2010 00:00          2 Canada          
       10981 03/27/2010 00:00          1 Brazil          
       10980 03/27/2010 00:00          4 Sweden          
       10983 03/27/2010 00:00          2 USA             
       10979 03/26/2010 00:00          8 Austria         
       10978 03/26/2010 00:00          9 Belgium         
       10977 03/26/2010 00:00          8 Sweden          

 17 rows selected  

--EXPLANATION: This query is a simple SELECT on two tables. I JOIN orders and employees
--ON employeeid. To restrict output to the criteria specified, I use the BETWEEN operator
--on orderdate. Notice that I use the +1 on the left date and -1 on the right date. This
--is to force exclusion of the days required. I also format the dates to see if there are 
--times. This was to verify that the cutoffs worked properly, although there was no additional
--resolution beyond day.


--*****************************************************************************************************************
--QUESTION 2(b): List the employee names linked to these orders. Use a single column to display the combination of:
--Title + First name + Last name (e.g., Mr. Karl Eller) along with these results. 
--Give this column a heading of: Employee Name.
select corp.orders.orderid as "Order Number", to_char(corp.orders.orderdate, 'MM/dd/YYYY hh24:mi') as "Order Date", 
corp.employees.titleofcourtesy || ' ' ||corp.employees.firstname || ' ' || corp.employees.lastname as "Employee Name", 
corp.orders.shipcountry as "Ship Country"
from corp.orders, corp.employees
where corp.orders.employeeid = corp.employees.employeeid
and corp.orders.orderdate between to_date('03/25/2010', 'MM/dd/YYYY')+1 and to_date('04/02/2010 00:00', 'MM/dd/YYYY hh24:mi')-1
order by corp.orders.orderdate desc;

--OUTPUT:
Order Number Order Date       Employee Name                                             Ship Country  
------------ ---------------- --------------------------------------------------------- ---------------
       10991 04/01/2010 00:00 Ms. Nancy Davolio                                         Germany         
       10993 04/01/2010 00:00 Mr. Robert King                                           Sweden          
       10992 04/01/2010 00:00 Ms. Nancy Davolio                                         USA             
       10990 04/01/2010 00:00 Dr. Andrew Fuller                                         Austria         
       10987 03/31/2010 00:00 Mr. Abel Bossini                                          UK              
       10988 03/31/2010 00:00 Ms. Janet Leverling                                       USA             
       10989 03/31/2010 00:00 Dr. Andrew Fuller                                         Brazil          
       10984 03/30/2010 00:00 Ms. Nancy Davolio                                         USA             
       10986 03/30/2010 00:00 Mr. Abel Bossini                                          Argentina       
       10985 03/30/2010 00:00 Dr. Andrew Fuller                                         Ireland         
       10980 03/27/2010 00:00 Mrs. Margaret Peacock                                     Sweden          
       10983 03/27/2010 00:00 Dr. Andrew Fuller                                         USA             
       10981 03/27/2010 00:00 Ms. Nancy Davolio                                         Brazil          
       10982 03/27/2010 00:00 Dr. Andrew Fuller                                         Canada          
       10979 03/26/2010 00:00 Mr. Abel Bossini                                          Austria         
       10977 03/26/2010 00:00 Mr. Abel Bossini                                          Sweden          
       10978 03/26/2010 00:00 Ms. Anne Dodsworth                                        Belgium         

 17 rows selected 

--EXPLANATION: This is the same SELECT and JOIN as above. In addition, we query the name information and
--concatenate them into a readable column. 


--*****************************************************************************************************************
--QUESTION 2(c): Next, add the city where the customers placing the order are based (heading: Customer City).
select corp.orders.orderid as "Order Number", to_char(corp.orders.orderdate, 'MM/dd/YYYY hh24:mi') as "Order Date", 
corp.employees.titleofcourtesy || ' ' ||corp.employees.firstname || ' ' || corp.employees.lastname as "Employee Name", 
corp.orders.shipcountry as "Ship Country",
corp.customers.city as "Customer City"
from corp.orders, corp.employees, corp.customers
where corp.orders.employeeid = corp.employees.employeeid
and corp.customers.custid = corp.orders.custid
and corp.orders.orderdate between to_date('03/25/2010', 'MM/dd/YYYY')+1 and to_date('04/02/2010 00:00', 'MM/dd/YYYY hh24:mi')-1
order by corp.orders.orderdate desc;

--OUTPUT:
Order Number Order Date       Employee Name                                             Ship Country    Customer City 
------------ ---------------- --------------------------------------------------------- --------------- ---------------
       10991 04/01/2010 00:00 Ms. Nancy Davolio                                         Germany         Cunewalde       
       10990 04/01/2010 00:00 Dr. Andrew Fuller                                         Austria         Graz            
       10993 04/01/2010 00:00 Mr. Robert King                                           Sweden          Brdcke          
       10992 04/01/2010 00:00 Ms. Nancy Davolio                                         USA             Portland        
       10988 03/31/2010 00:00 Ms. Janet Leverling                                       USA             Albuquerque     
       10987 03/31/2010 00:00 Mr. Abel Bossini                                          UK              London          
       10989 03/31/2010 00:00 Dr. Andrew Fuller                                         Brazil          Rio de Janeiro  
       10985 03/30/2010 00:00 Dr. Andrew Fuller                                         Ireland         Cork            
       10984 03/30/2010 00:00 Ms. Nancy Davolio                                         USA             Boise           
       10986 03/30/2010 00:00 Mr. Abel Bossini                                          Argentina       Buenos Aires    
       10983 03/27/2010 00:00 Dr. Andrew Fuller                                         USA             Boise           
       10982 03/27/2010 00:00 Dr. Andrew Fuller                                         Canada          Tsawassen       
       10980 03/27/2010 00:00 Mrs. Margaret Peacock                                     Sweden          Brdcke          
       10981 03/27/2010 00:00 Ms. Nancy Davolio                                         Brazil          Rio de Janeiro  
       10977 03/26/2010 00:00 Mr. Abel Bossini                                          Sweden          Brdcke          
       10979 03/26/2010 00:00 Mr. Abel Bossini                                          Austria         Graz            
       10978 03/26/2010 00:00 Ms. Anne Dodsworth                                        Belgium         Bruxelles       

 17 rows selected 

--EXPLANATION: Again, it's the same query from the SELECT and JOIN standpoint. We only add a column from the orders
--table for "Customer City."


--*****************************************************************************************************************
--QUESTION 2(d): Filter out the orders from North America (i.e., do not show orders with a shipping country of
--USA, Canada or Mexico).
select corp.orders.orderid as "Order Number", to_char(corp.orders.orderdate, 'MM/dd/YYYY hh24:mi') as "Order Date", 
corp.employees.titleofcourtesy || ' ' ||corp.employees.firstname || ' ' || corp.employees.lastname as "Employee Name", 
corp.orders.shipcountry as "Ship Country",
corp.customers.city as "Customer City"
from corp.orders, corp.employees, corp.customers
where corp.orders.shipcountry not in('USA', 'Canada', 'Mexico')
and corp.orders.employeeid = corp.employees.employeeid
and corp.customers.custid = corp.orders.custid
and corp.orders.orderdate between to_date('03/25/2010', 'MM/dd/YYYY')+1 and to_date('04/02/2010 00:00', 'MM/dd/YYYY hh24:mi')-1
order by corp.orders.orderdate desc; 

--OUTPUT: 
Order Number Order Date       Employee Name                                             Ship Country    Customer City 
------------ ---------------- --------------------------------------------------------- --------------- ---------------
       10990 04/01/2010 00:00 Dr. Andrew Fuller                                         Austria         Graz            
       10993 04/01/2010 00:00 Mr. Robert King                                           Sweden          Brdcke          
       10991 04/01/2010 00:00 Ms. Nancy Davolio                                         Germany         Cunewalde       
       10989 03/31/2010 00:00 Dr. Andrew Fuller                                         Brazil          Rio de Janeiro  
       10987 03/31/2010 00:00 Mr. Abel Bossini                                          UK              London          
       10985 03/30/2010 00:00 Dr. Andrew Fuller                                         Ireland         Cork            
       10986 03/30/2010 00:00 Mr. Abel Bossini                                          Argentina       Buenos Aires    
       10981 03/27/2010 00:00 Ms. Nancy Davolio                                         Brazil          Rio de Janeiro  
       10980 03/27/2010 00:00 Mrs. Margaret Peacock                                     Sweden          Brdcke          
       10977 03/26/2010 00:00 Mr. Abel Bossini                                          Sweden          Brdcke          
       10979 03/26/2010 00:00 Mr. Abel Bossini                                          Austria         Graz            
       10978 03/26/2010 00:00 Ms. Anne Dodsworth                                        Belgium         Bruxelles       

 12 rows selected  

--EXPLANATION: This query starts the same. However, we perform a MINUS operation using the NOT IN operator to 
--remove results from the original query.



