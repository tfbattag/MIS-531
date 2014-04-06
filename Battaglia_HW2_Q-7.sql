--QUESTION 7(a): Display the shipperID and shipper company names and company phone of 
--the shipping companies whose name start with “US” or “S”.
select s.shipperID, s.companyname, s.phone
from corp.shippers s
where s.companyname
like 'S%' or s.companyname like 'US%';  

--OUTPUT:

 SHIPPERID COMPANYNAME                              PHONE                  
---------- ---------------------------------------- ------------------------
         1 Speedy Express                           (520) 555-9831           
         4 USPS Ship                                (520) 555-6492

--EXPLANATION: This query is a very simple, one-table select using a LIKE to return names
--that match the patterns "US" or "S". 


--************************************************************************************************
--QUESTION 7(b): Show only those shipping companies which have not shipped a single order to Switzerland.
select distinct o.shipvia, s.companyname 
from corp.orders o, corp.shippers s
where o.shipvia not in (select o2.shipvia from corp.orders o2 where o2.shipcountry = 'Switzerland')
and s.shipperid = o.shipvia;

--OUTPUT:

   SHIPVIA COMPANYNAME                            
---------- ----------------------------------------
         4 USPS Ship 

--EXPLANATION: There art two queries here. The first outer query joins orders and shippers.
--The second query performs a MINUS by using the NOT IN to subtract results from the 
--outer query. The DISTINCT operator is used in the outer query to restrict output
--to one line of shippers.


--************************************************************************************************
--QUESTION 7(c): Additionally: show the number of orders that the company has shipped, heading: No. Orders Shipped, 
--the number of different countries (Heading: No. Countries) where shipper has sent the orders, 
--and the total freight charges for the shipper (Heading: Total Freight , format: $999,999.99).
select distinct o.shipvia, s.companyname, count(*) as "No. Orders Shipped", to_char(sum(o.freight), '$999,999.99') as "Total Freight"
from corp.orders o, corp.shippers s
where o.shipvia not in (select o2.shipvia from corp.orders o2 where o2.shipcountry = 'Switzerland')
and s.shipperid = o.shipvia
group by o.shipvia, s.companyname;

--OUTPUT:

   SHIPVIA COMPANYNAME                              No. Orders Shipped Total Freight
---------- ---------------------------------------- ------------------ -------------
         4 USPS Ship                                                36    $1,437.34

--EXPLANATION:  This query is based on the prior query to identify the one shipper
--that had not shipped to Switzerland. The aggregate functions count() and sum() are
--needed to count the number of shipments that would be returned for the shipper "USPS Ship".
--The sum() function sums the total from the o.freight column for each of the 36 lines 
--that the query would return. The GROUP BY is used to create a group for the query
--based primarily on the shipper's id (shipvia), but because the companyname is also
--needed, it must be included in the aggregation.  


--************************************************************************************************
--QUESTION 7(d): Show only those shippers that have shipped orders to fewer cities than the average 
--(i.e., if one were to compare with an average number of cities computed across all shippers).
select o.shipvia, s.companyname, count(distinct o.shipcity)
from corp.orders o, corp.shippers s
where o.shipvia = s.shipperid
group by o.shipvia, s.companyname 
having count(distinct o.shipcity) < 
(select avg(xx) from (select o2.shipvia, count(distinct o2.shipcity) as xx from corp.orders o2 group by o2.shipvia));

--OUTPUT:

   SHIPVIA COMPANYNAME                              Num Cities
---------- ---------------------------------------- ----------
         4 USPS Ship                                        26 
         5 Quick Delivery                                   31 

--EXPLANATION: I solved this by first writing two separate queries. The first one just gave the
--counts of different cities for each shipper: 
select o.shipvia, count(distinct o.shipcity) as "Counts"
from corp.orders o
group by o.shipvia;  --gives counts 

--Then, I wrote a query to compute the average of the results as follows: 
 
select avg(xx) from 
  (select o.shipvia, count(distinct o.shipcity) as xx
  from corp.orders o
  group by o.shipvia);  --49.8 is the average  

--This query uses a nested "from select" to return just the averages and nothing else.
--This is important in the next step.

--Then I combined the two where I could have the second query that computes the averages
--operate on the output of the first query's GROUP BY results. Thus, I used the
--HAVING keyword to combine two aggregation queries. The HAVING < operation
--filters the results to only shippers with less than 49.8 cities shipped to.
