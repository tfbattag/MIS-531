--QUESTION 5(a):The organization wants data on employee performance. 
--Select the number of orders each employee was responsible for. 
--Your output should show the employee Id (heading: EmployeeID), the employee name (Employee First Name + Employee Last Name in a single column, e.g., John Doe), 
--number of orders handled. (9 distinct employees)
select o.employeeid as "EmployeeID", e.firstname || ' ' || e.lastname as "Emp. Name", count(o.orderid) as "Number of Orders"
from corp.orders o, corp.employees e
where o.employeeid = e.employeeid
group by o.employeeid, e.lastname, e.firstname;  

--OUTPUT: 

EmployeeID Emp. Name                       Number of Orders
---------- ------------------------------- ----------------
         2 Andrew Fuller                                 95 
         7 Robert King                                   72 
         6 Michael Suyama                                67 
         3 Janet Leverling                              126 
         1 Nancy Davolio                                122 
         4 Margaret Peacock                             153 
         8 Abel Bossini                                 102 
         5 Steven Buchanan                               42 
         9 Anne Dodsworth                                43 

 9 rows selected  

--EXPLANATION: This query only required a simple inner JOIN to combine
--employee information with order information. The aggregation function
--to determine the number of orders was applied using COUNT() on orderid.
--Each group was determined by primarily orderid, but employee name inforamtion
--is also required.
--This query works by identifying groups which in this case are the
--counts of order occurences. Then the select pulls information across
--the two tables to complete the groups. 


--****************************************************************************************************
--QUESTION 5(b): Also show the number of customers each employee has served (across orders) with a heading of: "Customers Served". 
--Add a sort condition so results are listed by employeeID (ascending).
select o.employeeid as "EmployeeID", e.firstname || ' ' || e.lastname as "Emp. Name", count(o.orderid) as "Number of Orders", count(distinct o.custid) as "Customers Served"
from corp.orders o, corp.employees e
where o.employeeid = e.employeeid
group by o.employeeid, e.lastname, e.firstname
order by "EmployeeID" asc;   

--OUTPUT: 

EmployeeID Emp. Name                       Number of Orders Customers Served
---------- ------------------------------- ---------------- ----------------
         1 Nancy Davolio                                122               65 
         2 Andrew Fuller                                 95               58 
         3 Janet Leverling                              126               63 
         4 Margaret Peacock                             153               73 
         5 Steven Buchanan                               42               29 
         6 Michael Suyama                                67               43 
         7 Robert King                                   72               45 
         8 Abel Bossini                                 102               55 
         9 Anne Dodsworth                                43               29 

 9 rows selected  

--EXPLANATION: This query is primariily identical to the above. The difference is that
--we also aggregate on the count of customers served. To acquire customers served as implied in 
--natural language, the DISTINCT operator is applied to the counting of custids, as each customer 
--had placed many orders.


--****************************************************************************************************
--QUESTION 5(c): Show the average time of shipment of these orders (i.e., number of days between the date the order was placed and the order was shipped) 
--with a heading of: Average ShipDays. Format the column to 2 decimal places.
select o.employeeid as "EmployeeID", e.firstname || ' ' || e.lastname as "Emp. Name", 
count(o.orderid) as "Number of Orders", count(distinct o.custid) as "Customers Served",
to_char(avg(o.shippeddate - o.orderdate), '99,999.99') as "Average ShipDays"
from corp.orders o, corp.employees e
where o.employeeid = e.employeeid
group by o.employeeid, e.lastname, e.firstname
order by "EmployeeID" asc;   

--OUTPUT:  

EmployeeID Emp. Name                       Number of Orders Customers Served Average ShipDays
---------- ------------------------------- ---------------- ---------------- ----------------
         1 Nancy Davolio                                122               65       7.66       
         2 Andrew Fuller                                 95               58       8.03       
         3 Janet Leverling                              126               63       8.42       
         4 Margaret Peacock                             153               73       8.80       
         5 Steven Buchanan                               42               29       7.02       
         6 Michael Suyama                                67               43       9.09       
         7 Robert King                                   72               45       8.38       
         8 Abel Bossini                                 102               55       8.79       
         9 Anne Dodsworth                                43               29      10.52       

 9 rows selected 

--EXPLANATION: Again, the basis for this query is not changed. There is additional aggregation
--needed to compute the average number of shipping days for each employee's orders. To produce the
--average shipping time, we subtract the shipdate from the orderdate to get the time elapsed. Then,
--we modify the query by aggregating for the employee by applying the AVG() function to the computation.


--****************************************************************************************************
--QUESTION 5(d): Modify the query to take into account shipped dates that are null. 
--Assume such orders were shipped immediately (i.e., 0 days between placing and shipping the order).
select o.employeeid as "EmployeeID", e.firstname || ' ' || e.lastname as "Emp. Name", 
count(o.orderid) as "Number of Orders", count(distinct o.custid) as "Customers Served",
to_char(avg(coalesce(o.shippeddate - o.orderdate,0)), '99,9999.99') as "Average ShipDays"
from corp.orders o, corp.employees e
where o.employeeid = e.employeeid
group by o.employeeid, e.lastname, e.firstname
order by "EmployeeID" asc;  

--OUTPUT: 

EmployeeID Emp. Name                       Number of Orders Customers Served Average ShipDays
---------- ------------------------------- ---------------- ---------------- ----------------
         1 Nancy Davolio                                122               65        7.48      
         2 Andrew Fuller                                 95               58        7.78      
         3 Janet Leverling                              126               63        8.42      
         4 Margaret Peacock                             153               73        8.51      
         5 Steven Buchanan                               42               29        7.02      
         6 Michael Suyama                                67               43        8.82      
         7 Robert King                                   72               45        8.03      
         8 Abel Bossini                                 102               55        8.44      
         9 Anne Dodsworth                                43               29       10.28      

 9 rows selected    

--EXPLANATION: To account for null shipping dates, the easies way to deal with it was to apply the
--COALESCE function during the aggreagtion of the averages, substituting zeros for nulls. Otherwise,
--the query is unchanged.


--****************************************************************************************************
--QUESTION 5(e): Show only those employees who have No of Orders greater than 100 and Average shipping days less than 8.5 days.
select o.employeeid as "EmployeeID", e.firstname || ' ' || e.lastname as "Emp. Name", 
count(o.orderid) as "Number of Orders", count(distinct o.custid) as "Customers Served",
to_char(avg(coalesce(o.shippeddate - o.orderdate,0)), '99,9999.99') as "Average ShipDays"
from corp.orders o, corp.employees e
where o.employeeid = e.employeeid
group by o.employeeid, e.lastname, e.firstname
having((count(o.orderid) > 100) and avg(coalesce(o.shippeddate - o.orderdate,0)) < 8.5)
order by "EmployeeID" asc;  

--OUTPUT:

EmployeeID Emp. Name                       Number of Orders Customers Served Average ShipDays
---------- ------------------------------- ---------------- ---------------- ----------------
         1 Nancy Davolio                                122               65        7.48      
         3 Janet Leverling                              126               63        8.42      
         8 Abel Bossini                                 102               55        8.44 

--EXPLANATION: The only requirement here is to apply a filter to the groupings using the HAVING
--operator. It does require two conditions (> 100 and < 8.5 days). Thus, I used the AND logical
--operator to require both conditions to be met.
