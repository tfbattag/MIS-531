--QUESTION 4(a): Find the orders placed in 2008 to be shipped to Austria, Switzerland, Italy. 
--Display the orderID (heading: Order Number), customer country (heading: Customer Country), customer company name (heading: Purchaser).
select o.orderid as "Order Number", o.orderdate, o.shipcountry, cu.country as "Customer Country", cu.companyname as "Purchaser"
from corp.orders o, corp.customers cu
where (o.orderdate > to_date('01/01/2008', 'MM/dd/YYYY') and o.orderdate < to_date('01/01/2009', 'MM/dd/YYYY'))
and cu.custid = o.custid
and o.shipcountry in('Austria', 'Switzerland', 'Italy'); 

--OUTPUT:
Order Number ORDERDATE SHIPCOUNTRY     Customer Country Purchaser                              
------------ --------- --------------- ---------------- ----------------------------------------
       10370 03-DEC-08 Switzerland     Switzerland      Chop-suey Chinese                        
       10254 11-JUL-08 Switzerland     Switzerland      Chop-suey Chinese                        
       10390 23-DEC-08 Austria         Austria          Ernst Handel                             
       10382 13-DEC-08 Austria         Austria          Ernst Handel                             
       10368 29-NOV-08 Austria         Austria          Ernst Handel                             
       10351 11-NOV-08 Austria         Austria          Ernst Handel                             
       10263 23-JUL-08 Austria         Austria          Ernst Handel                             
       10258 17-JUL-08 Austria         Austria          Ernst Handel                             
       10300 09-SEP-08 Italy           Italy            Magazzini Alimentari Riuniti             
       10275 07-AUG-08 Italy           Italy            Magazzini Alimentari Riuniti             
       10392 24-DEC-08 Austria         Austria          Piccolo und mehr                         
       10353 13-NOV-08 Austria         Austria          Piccolo und mehr                         
       10288 23-AUG-08 Italy           Italy            Reggiani Caseifici                       
       10255 12-JUL-08 Switzerland     Switzerland      Richter Supermarkt                       

 14 rows selected 

--EXPLANATION: This query is a simple JOIN between the orders and customers tables with some criteria
--added. I use an IN operation to restrict results to a listing of the countries that we want. To set the date
--range, I used the AND to set the limits on the range as opposed to the BETWEEN. This was only for
--simplicity and to ensure that the cutoffs were exactly at the beginning of each day.



--****************************************************************************************************
--QUESTION 4(b): Each order may have multiple products. 
--Add a column in the output to show the product name (heading: Product Name). 
--Note: if there is no direct way to link a table to an existing set of tables, 
--you may have to add one or more tables for the purpose of joining (even if they play no part in the output).
select o.orderid as "Order Number", o.orderdate, o.shipcountry, cu.country as "Customer Country", cu.companyname as "Purchaser", p.productname as "Product Name"
from corp.orders o, corp.customers cu, corp.order_details od, corp.products p
where (o.orderdate > to_date('01/01/2008', 'MM/dd/YYYY') and o.orderdate < to_date('01/01/2009', 'MM/dd/YYYY'))
and cu.custid = o.custid
and o.shipcountry in('Austria', 'Switzerland', 'Italy')
and od.orderid = o.orderid
and p.productid = od.productid
order by o.orderid asc, p.productname;   

--OUTPUT: 
Order Number ORDERDATE SHIPCOUNTRY     Customer Country Purchaser                                Product Name                           
------------ --------- --------------- ---------------- ---------------------------------------- ----------------------------------------
       10254 11-JUL-08 Switzerland     Switzerland      Chop-suey Chinese                        Guarana Fantastica                       
       10254 11-JUL-08 Switzerland     Switzerland      Chop-suey Chinese                        Longlife Tofu                            
       10254 11-JUL-08 Switzerland     Switzerland      Chop-suey Chinese                        Pbti chinois                             
       10255 12-JUL-08 Switzerland     Switzerland      Richter Supermarkt                       Chang                                    
       10255 12-JUL-08 Switzerland     Switzerland      Richter Supermarkt                       Inlagd Sill                              
       10255 12-JUL-08 Switzerland     Switzerland      Richter Supermarkt                       Pavlova                                  
       10255 12-JUL-08 Switzerland     Switzerland      Richter Supermarkt                       Raclette Courdavault                     
       10258 17-JUL-08 Austria         Austria          Ernst Handel                             Chang                                    
       10258 17-JUL-08 Austria         Austria          Ernst Handel                             Chef Anton's Gumbo Mix                   
       10258 17-JUL-08 Austria         Austria          Ernst Handel                             Mascarpone Fabioli                       
       10263 23-JUL-08 Austria         Austria          Ernst Handel                             Guarana Fantastica                       
       10263 23-JUL-08 Austria         Austria          Ernst Handel                             Longlife Tofu                            
       10263 23-JUL-08 Austria         Austria          Ernst Handel                             Nord-Ost Matjeshering                    
       10263 23-JUL-08 Austria         Austria          Ernst Handel                             Pavlova                                  
       10275 07-AUG-08 Italy           Italy            Magazzini Alimentari Riuniti             Guarana Fantastica                       
       10275 07-AUG-08 Italy           Italy            Magazzini Alimentari Riuniti             Raclette Courdavault                     
       10288 23-AUG-08 Italy           Italy            Reggiani Caseifici                       Scottish Longbreads                      
       10288 23-AUG-08 Italy           Italy            Reggiani Caseifici                       Tourtihre                                
       10300 09-SEP-08 Italy           Italy            Magazzini Alimentari Riuniti             Louisiana Hot Spiced Okra                
       10300 09-SEP-08 Italy           Italy            Magazzini Alimentari Riuniti             Scottish Longbreads                      
       10351 11-NOV-08 Austria         Austria          Ernst Handel                             Ctte de Blaye                            
       10351 11-NOV-08 Austria         Austria          Ernst Handel                             Gula Malacca                             
       10351 11-NOV-08 Austria         Austria          Ernst Handel                             Jack's New England Clam Chowder          
       10351 11-NOV-08 Austria         Austria          Ernst Handel                             Louisiana Fiery Hot Pepper Sauce         
       10353 13-NOV-08 Austria         Austria          Piccolo und mehr                         Ctte de Blaye                            
       10353 13-NOV-08 Austria         Austria          Piccolo und mehr                         Queso Cabrales                           
       10368 29-NOV-08 Austria         Austria          Ernst Handel                             Ravioli Angelo                           
       10368 29-NOV-08 Austria         Austria          Ernst Handel                             Rvssle Sauerkraut                        
       10368 29-NOV-08 Austria         Austria          Ernst Handel                             Sir Rodney's Scones                      
       10368 29-NOV-08 Austria         Austria          Ernst Handel                             Wimmers gute Semmelknvdel                
       10370 03-DEC-08 Switzerland     Switzerland      Chop-suey Chinese                        Chai                                     
       10370 03-DEC-08 Switzerland     Switzerland      Chop-suey Chinese                        Longlife Tofu                            
       10370 03-DEC-08 Switzerland     Switzerland      Chop-suey Chinese                        Wimmers gute Semmelknvdel                
       10382 13-DEC-08 Austria         Austria          Ernst Handel                             Carnarvon Tigers                         
       10382 13-DEC-08 Austria         Austria          Ernst Handel                             Chef Anton's Gumbo Mix                   
       10382 13-DEC-08 Austria         Austria          Ernst Handel                             Geitost                                  
       10382 13-DEC-08 Austria         Austria          Ernst Handel                             Longlife Tofu                            
       10382 13-DEC-08 Austria         Austria          Ernst Handel                             Thüringer Rostbratwurst                  
       10390 23-DEC-08 Austria         Austria          Ernst Handel                             Gorgonzola Telino                        
       10390 23-DEC-08 Austria         Austria          Ernst Handel                             Mozzarella di Giovanni                   
       10390 23-DEC-08 Austria         Austria          Ernst Handel                             Spegesild                                
       10390 23-DEC-08 Austria         Austria          Ernst Handel                             Steeleye Stout                           
       10392 24-DEC-08 Austria         Austria          Piccolo und mehr                         Gudbrandsdalsost                         

 43 rows selected            

--EXPLANATION: This query required the JOIN of four tables to access the required information:
--orders, order_details, customers and products. The filtering stayed the same as the prior, but
--the requirement for adding the product name for each item ordered within an order required joining
--the order_details table to orders. To get the names for each product, I joined order_details to 
--products on productid. This query retrieves all entries from order_detail that meet the criteria.
--Thus the increase from 14 records to 43. By sorting on orderid first, they are "grouped" closely
--in the resultset. A secondary sort is applied to product name that sorts after the first sort.


--****************************************************************************************************
--QUESTION 4(c): Next, calculate the total sale price ($) for each order line and give it a heading of: Sale Price. 
--If there are two different products linked to the order they will be shown in different output rows. 
--Ignore discounts.
select o.orderid as "Order Number", o.shipcountry, 
cu.country as "Customer Country", cu.companyname as "Purchaser", p.productname as "Product Name",
(od.quantity * od.unitprice) as "Sale Price"
from corp.orders o, corp.customers cu, corp.order_details od, corp.products p
where (o.orderdate > to_date('01/01/2008', 'MM/dd/YYYY') and o.orderdate < to_date('01/01/2009', 'MM/dd/YYYY'))
and cu.custid = o.custid
and o.shipcountry in('Austria', 'Switzerland', 'Italy')
and od.orderid = o.orderid
and p.productid = od.productid
order by o.orderid asc, p.productname;   

--OUTPUT:

Order Number SHIPCOUNTRY     Customer Country Purchaser                                Product Name                             Sale Price
------------ --------------- ---------------- ---------------------------------------- ---------------------------------------- ----------
       10254 Switzerland     Switzerland      Chop-suey Chinese                        Guarana Fantastica                               54 
       10254 Switzerland     Switzerland      Chop-suey Chinese                        Longlife Tofu                                   168 
       10254 Switzerland     Switzerland      Chop-suey Chinese                        Pbti chinois                                  403.2 
       10255 Switzerland     Switzerland      Richter Supermarkt                       Chang                                           304 
       10255 Switzerland     Switzerland      Richter Supermarkt                       Inlagd Sill                                     380 
       10255 Switzerland     Switzerland      Richter Supermarkt                       Pavlova                                       486.5 
       10255 Switzerland     Switzerland      Richter Supermarkt                       Raclette Courdavault                           1320 
       10258 Austria         Austria          Ernst Handel                             Chang                                           760 
       10258 Austria         Austria          Ernst Handel                             Chef Anton's Gumbo Mix                         1105 
       10258 Austria         Austria          Ernst Handel                             Mascarpone Fabioli                            153.6 
       10263 Austria         Austria          Ernst Handel                             Guarana Fantastica                            100.8 
       10263 Austria         Austria          Ernst Handel                             Longlife Tofu                                   288 
       10263 Austria         Austria          Ernst Handel                             Nord-Ost Matjeshering                          1242 
       10263 Austria         Austria          Ernst Handel                             Pavlova                                         834 
       10275 Italy           Italy            Magazzini Alimentari Riuniti             Guarana Fantastica                             43.2 
       10275 Italy           Italy            Magazzini Alimentari Riuniti             Raclette Courdavault                            264 
       10288 Italy           Italy            Reggiani Caseifici                       Scottish Longbreads                              30 
       10288 Italy           Italy            Reggiani Caseifici                       Tourtihre                                        59 
       10300 Italy           Italy            Magazzini Alimentari Riuniti             Louisiana Hot Spiced Okra                       408 
       10300 Italy           Italy            Magazzini Alimentari Riuniti             Scottish Longbreads                             200 
       10351 Austria         Austria          Ernst Handel                             Ctte de Blaye                                  4216 
       10351 Austria         Austria          Ernst Handel                             Gula Malacca                                 1193.5 
       10351 Austria         Austria          Ernst Handel                             Jack's New England Clam Chowder               100.1 
       10351 Austria         Austria          Ernst Handel                             Louisiana Fiery Hot Pepper Sauce                168 
       10353 Austria         Austria          Piccolo und mehr                         Ctte de Blaye                                 10540 
       10353 Austria         Austria          Piccolo und mehr                         Queso Cabrales                                201.6 
       10368 Austria         Austria          Ernst Handel                             Ravioli Angelo                                  390 
       10368 Austria         Austria          Ernst Handel                             Rvssle Sauerkraut                             473.2 
       10368 Austria         Austria          Ernst Handel                             Sir Rodney's Scones                              40 
       10368 Austria         Austria          Ernst Handel                             Wimmers gute Semmelknvdel                       931 
       10370 Switzerland     Switzerland      Chop-suey Chinese                        Chai                                            216 
       10370 Switzerland     Switzerland      Chop-suey Chinese                        Longlife Tofu                                   160 
       10370 Switzerland     Switzerland      Chop-suey Chinese                        Wimmers gute Semmelknvdel                       798 
       10382 Austria         Austria          Ernst Handel                             Carnarvon Tigers                                450 
       10382 Austria         Austria          Ernst Handel                             Chef Anton's Gumbo Mix                          544 
       10382 Austria         Austria          Ernst Handel                             Geitost                                         120 
       10382 Austria         Austria          Ernst Handel                             Longlife Tofu                                   400 
       10382 Austria         Austria          Ernst Handel                             Thüringer Rostbratwurst                        1386 
       10390 Austria         Austria          Ernst Handel                             Gorgonzola Telino                               600 
       10390 Austria         Austria          Ernst Handel                             Mozzarella di Giovanni                        667.2 
       10390 Austria         Austria          Ernst Handel                             Spegesild                                       432 
       10390 Austria         Austria          Ernst Handel                             Steeleye Stout                                  576 
       10392 Austria         Austria          Piccolo und mehr                         Gudbrandsdalsost                               1440 

 43 rows selected 

--EXPLANATION: This query is only different from the prior in that it only adds a computation for each individual
--line/record in the resultset. This is different than an aggregation. The computation happens discretely for each
--record retrieved. To compute, I only needed to multiply quantity and unitprice to come up with the amount for 
--each order_details line. No formatting was requested.


--****************************************************************************************************
--QUESTION 4(d): (introducing aggregation) Drop the output columns of Product Name and Sale Price from the previous parts. 
--Instead, add columns for: how many products were included in the order (heading: Num Products) 
--and total order sale price with a heading of: Order Total (i.e., across all products sold in that order; continue to ignore discounts). 
--Here the order id will be shown distinctly.
select o.orderid as "Order Number", o.shipcountry, 
cu.country as "Customer Country", cu.companyname as "Purchaser",
sum(od.quantity) as "Num Products",
sum(od.quantity * od.unitprice) as "Order Total"
from corp.orders o, corp.customers cu, corp.order_details od, corp.products p
where (o.orderdate > to_date('01/01/2008', 'MM/dd/YYYY') and o.orderdate < to_date('01/01/2009', 'MM/dd/YYYY'))
and cu.custid = o.custid
and o.shipcountry in('Austria', 'Switzerland', 'Italy')
and od.orderid = o.orderid
and p.productid = od.productid
group by o.orderid, o.shipcountry, cu.country, cu.companyname;  

--OUTPUT:

Order Number SHIPCOUNTRY     Customer Country Purchaser                                Num Products Order Total
------------ --------------- ---------------- ---------------------------------------- ------------ -----------
       10263 Austria         Austria          Ernst Handel                                      184      2464.8 
       10392 Austria         Austria          Piccolo und mehr                                   50        1440 
       10254 Switzerland     Switzerland      Chop-suey Chinese                                  57       625.2 
       10300 Italy           Italy            Magazzini Alimentari Riuniti                       50         608 
       10353 Austria         Austria          Piccolo und mehr                                   62     10741.6 
       10390 Austria         Austria          Ernst Handel                                      169      2275.2 
       10288 Italy           Italy            Reggiani Caseifici                                 13          89 
       10368 Austria         Austria          Ernst Handel                                       78      1834.2 
       10382 Austria         Austria          Ernst Handel                                      165        2900 
       10255 Switzerland     Switzerland      Richter Supermarkt                                110      2490.5 
       10351 Austria         Austria          Ernst Handel                                      120      5677.6 
       10258 Austria         Austria          Ernst Handel                                      121      2018.6 
       10275 Italy           Italy            Magazzini Alimentari Riuniti                       18       307.2 
       10370 Switzerland     Switzerland      Chop-suey Chinese                                  65        1174 

 14 rows selected

--EXPLANATION: This query differs from the prior. The first thing to notice is that it reduces the number of
--records retrived from the number of order_details entries (43) to the number of orders entries (14). By 
--applying aggregation using the SUM() funtion on the od.quantity and (od.quantity * od.unitprice), we are
--able to compute these sums for the groups of orders through creating groups on primairly orderid. I did not 
-- ORDER BY on orderid only because it wasn't requested. However, I could have ordered ascending on orderid. 
--Also, ordering is requested in the next question.
 

--****************************************************************************************************
--QUESTION 4(e): Show the order total in the format of $999,999.99. 
--Add a sorting condition: sort the results by total sale price of the order; highest order total should be shown first.
select o.orderid as "Order Number", o.shipcountry, 
cu.country as "Customer Country", cu.companyname as "Purchaser",
sum(od.quantity) as "Num Products",
to_char(sum(od.quantity * od.unitprice), '$999,999,999.99') as "Order Total"
from corp.orders o, corp.customers cu, corp.order_details od, corp.products p
where (o.orderdate > to_date('01/01/2008', 'MM/dd/YYYY') and o.orderdate < to_date('01/01/2009', 'MM/dd/YYYY'))
and cu.custid = o.custid
and o.shipcountry in('Austria', 'Switzerland', 'Italy')
and od.orderid = o.orderid
and p.productid = od.productid
group by o.orderid, o.shipcountry, cu.country, cu.companyname
order by "Order Total" desc;

--OUTPUT:

Order Number SHIPCOUNTRY     Customer Country Purchaser                                Num Products Order Total    
------------ --------------- ---------------- ---------------------------------------- ------------ ----------------
       10353 Austria         Austria          Piccolo und mehr                                   62       $10,741.60 
       10351 Austria         Austria          Ernst Handel                                      120        $5,677.60 
       10382 Austria         Austria          Ernst Handel                                      165        $2,900.00 
       10255 Switzerland     Switzerland      Richter Supermarkt                                110        $2,490.50 
       10263 Austria         Austria          Ernst Handel                                      184        $2,464.80 
       10390 Austria         Austria          Ernst Handel                                      169        $2,275.20 
       10258 Austria         Austria          Ernst Handel                                      121        $2,018.60 
       10368 Austria         Austria          Ernst Handel                                       78        $1,834.20 
       10392 Austria         Austria          Piccolo und mehr                                   50        $1,440.00 
       10370 Switzerland     Switzerland      Chop-suey Chinese                                  65        $1,174.00 
       10254 Switzerland     Switzerland      Chop-suey Chinese                                  57          $625.20 
       10300 Italy           Italy            Magazzini Alimentari Riuniti                       50          $608.00 
       10275 Italy           Italy            Magazzini Alimentari Riuniti                       18          $307.20 
       10288 Italy           Italy            Reggiani Caseifici                                 13           $89.00 

 14 rows selected 

--EXPLANATION: This is the same query as the last one with only two things changed. I format the order total
--to USD currency and sort on the order total using the ORDER BY function. I use DESC to put the highest value first.
