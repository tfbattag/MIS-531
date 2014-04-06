--QUESTION 6(a) For each product, display the product id (heading: ProductID), 
--product name (heading: Product Name), 
--and number of orders placed for that product (heading: No of Orders).
select od.productid, p.productname, count(od.productid) as "No of Orders"
from corp.order_details od, corp.products p
where p.productid = od.productid
group by od.productid, p.productid, p.productname
order by od.productid asc; 

--EXPALANTION: The first thing was to identify that there would be
--a grouping created based on the counts of the orders for each product.
--Thus, I knew that I would be countina and grouping based on productid.
--Then, I just needed results that would return all of the products that 
--were ever ordered. These came from the order_details table. The products
--table could have had items that had not ever been ordered.
--Last, I joined products and order_details on id to retrieve the names
--of the products. Ascending order was applied to productid.  

--OUTPUT:

 PRODUCTID PRODUCTNAME                              No of Orders
---------- ---------------------------------------- ------------
         1 Chai                                               38 
         2 Chang                                              43 
         3 Aniseed Syrup                                      12 
         4 Chef Anton's Cajun Seasoning                       20 
         5 Chef Anton's Gumbo Mix                             10 
         6 Grandma's Boysenberry Spread                       12 
         7 Uncle Bob's Organic Dried Pears                    29 
         8 Northwoods Cranberry Sauce                         13 
         9 Mishi Kobe Niku                                     5 
        10 Ikura                                              33 
        11 Queso Cabrales                                     38 
        12 Queso Manchego La Pastora                          14 
        13 Konbu                                              40 
        14 Tofu                                               22 
        15 Genen Shouyu                                        6 
        16 Pavlova                                            42 
        17 Alice Mutton                                       37 
        18 Carnarvon Tigers                                   26 
        19 Teatime Chocolate Biscuits                         37 
        20 Sir Rodney's Marmalade                             16 
        21 Sir Rodney's Scones                                39 
        22 Gustaf's Kndckebrvd                                14 
        23 Tunnbrvd                                           20 
        24 Guarana Fantastica                                 51 
        25 NuNuCa Nuß-Nougat-Creme                            18 
        26 Gumbdr Gummibdrchen                                32 
        27 Schoggi Schokolade                                  9 
        28 Rvssle Sauerkraut                                  33 
        29 Thüringer Rostbratwurst                            32 
        30 Nord-Ost Matjeshering                              31 
        31 Gorgonzola Telino                                  51 
        32 Mascarpone Fabioli                                 15 
        33 Geitost                                            32 
        34 Sasquatch Ale                                      19 
        35 Steeleye Stout                                     36 
        36 Inlagd Sill                                        31 
        37 Gravad lax                                          6 
        38 Ctte de Blaye                                      24 
        39 Chartreuse verte                                   30 
        40 Boston Crab Meat                                   41 
        41 Jack's New England Clam Chowder                    47 
        42 Singaporean Hokkien Fried Mee                      30 
        43 Ipoh Coffee                                        27 
        44 Gula Malacca                                       23 
        45 Rxgede sild                                        14 
        46 Spegesild                                          27 
        47 Zaanse koeken                                      21 
        48 Chocolade                                           6 
        49 Maxilaku                                           21 
        50 Valkoinen suklaa                                   10 
        51 Manjimup Dried Apples                              39 
        52 Filo Mix                                           29 
        53 Perth Pasties                                      30 
        54 Tourtihre                                          36 
        55 Pbti chinois                                       33 
        56 Gnocchi di nonna Alice                             50 
        57 Ravioli Angelo                                     23 
        58 Escargots de Bourgogne                             18 
        59 Raclette Courdavault                               54 
        60 Camembert Pierrot                                  51 
        61 Sirop dirable                                     24 
        62 Tarte au sucre                                     48 
        63 Vegie-spread                                       17 
        64 Wimmers gute Semmelknvdel                          30 
        65 Louisiana Fiery Hot Pepper Sauce                   32 
        66 Louisiana Hot Spiced Okra                           8 
        67 Laughing Lumberjack Lager                          10 
        68 Scottish Longbreads                                34 
        69 Gudbrandsdalsost                                   31 
        70 Outback Lager                                      39 
        71 Flxtemysost                                        42 
        72 Mozzarella di Giovanni                             38 
        73 Rvd Kaviar                                         14 
        74 Longlife Tofu                                      13 
        75 Rhvnbrdu Klosterbier                               46 
        76 Lakkalikvvri                                       39 
        77 Original Frankfurter grüne Soße                    38 

 77 rows selected 



--QUESTION 6(b): In the output: add product line names for all the products (heading: Line Name).
select od.productid, p.productname, pl.pl_name, count(od.productid) as "No of Orders"
from corp.order_details od, corp.products p, corp.product_lines pl
where p.productid = od.productid
and pl.pl_id = p.pl_id
group by od.productid, p.productid, p.productname, pl.pl_name
order by od.productid asc;  

--EXPLANATION: The query is basically the same as the prior query. Because the grouping
--was already identified and primarily operates on productid (althought the names of products
--and lines are required), I only needed to JOIN the prduct_lines table to the products
--table to retrieve the line-names for each product. Output is still restriced to 
--independent products by the GROUP BY.

--OUTPUT:

 PRODUCTID PRODUCTNAME                              PL_NAME         No of Orders
---------- ---------------------------------------- --------------- ------------
         1 Chai                                     Beverages                 38 
         2 Chang                                    Beverages                 43 
         3 Aniseed Syrup                            Condiments                12 
         4 Chef Anton's Cajun Seasoning             Condiments                20 
         5 Chef Anton's Gumbo Mix                   Condiments                10 
         6 Grandma's Boysenberry Spread             Condiments                12 
         7 Uncle Bob's Organic Dried Pears          Produce                   29 
         8 Northwoods Cranberry Sauce               Condiments                13 
         9 Mishi Kobe Niku                          Meat/Poultry               5 
        10 Ikura                                    Seafood                   33 
        11 Queso Cabrales                           Dairy Products            38 
        12 Queso Manchego La Pastora                Dairy Products            14 
        13 Konbu                                    Seafood                   40 
        14 Tofu                                     Produce                   22 
        15 Genen Shouyu                             Condiments                 6 
        16 Pavlova                                  Confections               42 
        17 Alice Mutton                             Meat/Poultry              37 
        18 Carnarvon Tigers                         Seafood                   26 
        19 Teatime Chocolate Biscuits               Confections               37 
        20 Sir Rodney's Marmalade                   Confections               16 
        21 Sir Rodney's Scones                      Confections               39 
        22 Gustaf's Kndckebrvd                      Grains/Cereals            14 
        23 Tunnbrvd                                 Grains/Cereals            20 
        24 Guarana Fantastica                       Beverages                 51 
        25 NuNuCa Nuß-Nougat-Creme                  Confections               18 
        26 Gumbdr Gummibdrchen                      Confections               32 
        27 Schoggi Schokolade                       Confections                9 
        28 Rvssle Sauerkraut                        Produce                   33 
        29 Thüringer Rostbratwurst                  Meat/Poultry              32 
        30 Nord-Ost Matjeshering                    Seafood                   31 
        31 Gorgonzola Telino                        Dairy Products            51 
        32 Mascarpone Fabioli                       Dairy Products            15 
        33 Geitost                                  Dairy Products            32 
        34 Sasquatch Ale                            Beverages                 19 
        35 Steeleye Stout                           Beverages                 36 
        36 Inlagd Sill                              Seafood                   31 
        37 Gravad lax                               Seafood                    6 
        38 Ctte de Blaye                            Beverages                 24 
        39 Chartreuse verte                         Beverages                 30 
        40 Boston Crab Meat                         Seafood                   41 
        41 Jack's New England Clam Chowder          Seafood                   47 
        42 Singaporean Hokkien Fried Mee            Grains/Cereals            30 
        43 Ipoh Coffee                              Beverages                 27 
        44 Gula Malacca                             Condiments                23 
        45 Rxgede sild                              Seafood                   14 
        46 Spegesild                                Seafood                   27 
        47 Zaanse koeken                            Confections               21 
        48 Chocolade                                Confections                6 
        49 Maxilaku                                 Confections               21 
        50 Valkoinen suklaa                         Confections               10 
        51 Manjimup Dried Apples                    Produce                   39 
        52 Filo Mix                                 Grains/Cereals            29 
        53 Perth Pasties                            Meat/Poultry              30 
        54 Tourtihre                                Meat/Poultry              36 
        55 Pbti chinois                             Meat/Poultry              33 
        56 Gnocchi di nonna Alice                   Grains/Cereals            50 
        57 Ravioli Angelo                           Grains/Cereals            23 
        58 Escargots de Bourgogne                   Seafood                   18 
        59 Raclette Courdavault                     Dairy Products            54 
        60 Camembert Pierrot                        Dairy Products            51 
        61 Sirop dirable                           Condiments                24 
        62 Tarte au sucre                           Confections               48 
        63 Vegie-spread                             Condiments                17 
        64 Wimmers gute Semmelknvdel                Grains/Cereals            30 
        65 Louisiana Fiery Hot Pepper Sauce         Condiments                32 
        66 Louisiana Hot Spiced Okra                Condiments                 8 
        67 Laughing Lumberjack Lager                Beverages                 10 
        68 Scottish Longbreads                      Confections               34 
        69 Gudbrandsdalsost                         Dairy Products            31 
        70 Outback Lager                            Beverages                 39 
        71 Flxtemysost                              Dairy Products            42 
        72 Mozzarella di Giovanni                   Dairy Products            38 
        73 Rvd Kaviar                               Seafood                   14 
        74 Longlife Tofu                            Produce                   13 
        75 Rhvnbrdu Klosterbier                     Beverages                 46 
        76 Lakkalikvvri                             Beverages                 39 
        77 Original Frankfurter grüne Soße          Condiments                38 

 77 rows selected


--QUESTION 6(c): Show the total sales (dollar value of sales) made for each product in the format of $999,999.00.
--Heading: Total Sales. Ignore discounts for this part.
select od.productid, p.productname, pl.pl_name, count(od.productid) as "No of Orders", to_char(sum(od.unitprice * od.quantity), '$999,999.99') as "Total Sales"
from corp.order_details od, corp.products p, corp.product_lines pl
where p.productid = od.productid
and pl.pl_id = p.pl_id
group by od.productid, p.productid, p.productname, pl.pl_name
order by od.productid asc; 

--EXPLANATION: The basic construct for this query has not changed much. The only requirement
--was to display the total sales for each product already queried. Thus, I added a computation
--that would determine the sales amount for each product throughout all entries in the 
--order_details table. This computation first multiplies unitprice and quantity to determine 
--the amount for each entry in the oreder_details table and then sums them for each product
--based on the aggregation of productid. Formatting is applied using the TO_CHAR function.

--OUTPUT:

 PRODUCTID PRODUCTNAME                              PL_NAME         No of Orders Total Sales
---------- ---------------------------------------- --------------- ------------ ------------
         1 Chai                                     Beverages                 38   $14,277.60 
         2 Chang                                    Beverages                 43   $17,951.20 
         3 Aniseed Syrup                            Condiments                12    $3,080.00 
         4 Chef Anton's Cajun Seasoning             Condiments                20    $9,424.80 
         5 Chef Anton's Gumbo Mix                   Condiments                10    $5,801.15 
         6 Grandma's Boysenberry Spread             Condiments                12    $7,345.00 
         7 Uncle Bob's Organic Dried Pears          Produce                   29   $22,464.00 
         8 Northwoods Cranberry Sauce               Condiments                13   $13,760.00 
         9 Mishi Kobe Niku                          Meat/Poultry               5    $8,827.00 
        10 Ikura                                    Seafood                   33   $22,140.20 
        11 Queso Cabrales                           Dairy Products            38   $13,902.00 
        12 Queso Manchego La Pastora                Dairy Products            14   $12,866.80 
        13 Konbu                                    Seafood                   40    $5,234.40 
        14 Tofu                                     Produce                   22    $8,630.40 
        15 Genen Shouyu                             Condiments                 6    $1,813.50 
        16 Pavlova                                  Confections               42   $18,261.55 
        17 Alice Mutton                             Meat/Poultry              37   $35,482.20 
        18 Carnarvon Tigers                         Seafood                   26   $30,487.50 
        19 Teatime Chocolate Biscuits               Confections               37    $6,159.50 
        20 Sir Rodney's Marmalade                   Confections               16   $23,635.80 
        21 Sir Rodney's Scones                      Confections               39    $9,636.00 
        22 Gustaf's Kndckebrvd                      Grains/Cereals            14    $7,232.40 
        23 Tunnbrvd                                 Grains/Cereals            20    $4,840.20 
        24 Guarana Fantastica                       Beverages                 51    $4,782.60 
        25 NuNuCa Nuß-Nougat-Creme                  Confections               18    $4,051.60 
        26 Gumbdr Gummibdrchen                      Confections               32   $21,534.90 
        27 Schoggi Schokolade                       Confections                9   $15,231.50 
        28 Rvssle Sauerkraut                        Produce                   33   $26,865.60 
        29 Thüringer Rostbratwurst                  Meat/Poultry              32   $87,736.40 
        30 Nord-Ost Matjeshering                    Seafood                   31   $14,609.94 
        31 Gorgonzola Telino                        Dairy Products            51   $16,172.50 
        32 Mascarpone Fabioli                       Dairy Products            15    $9,171.20 
        33 Geitost                                  Dairy Products            32    $1,713.50 
        34 Sasquatch Ale                            Beverages                 19    $6,678.00 
        35 Steeleye Stout                           Beverages                 36   $14,536.80 
        36 Inlagd Sill                              Seafood                   31   $14,542.60 
        37 Gravad lax                               Seafood                    6    $3,047.20 
        38 Ctte de Blaye                            Beverages                 24  $149,984.20 
        39 Chartreuse verte                         Beverages                 30   $13,150.80 
        40 Boston Crab Meat                         Seafood                   41   $19,048.30 
        41 Jack's New England Clam Chowder          Seafood                   47    $9,098.10 
        42 Singaporean Hokkien Fried Mee            Grains/Cereals            30    $9,332.40 
        43 Ipoh Coffee                              Beverages                 27   $24,527.20 
        44 Gula Malacca                             Condiments                23   $10,493.20 
        45 Rxgede sild                              Seafood                   14    $4,740.50 
        46 Spegesild                                Seafood                   27    $6,144.00 
        47 Zaanse koeken                            Confections               21    $4,358.60 
        48 Chocolade                                Confections                6    $1,542.75 
        49 Maxilaku                                 Confections               21    $9,500.00 
        50 Valkoinen suklaa                         Confections               10    $3,510.00 
        51 Manjimup Dried Apples                    Produce                   39   $44,742.60 
        52 Filo Mix                                 Grains/Cereals            29    $3,383.80 
        53 Perth Pasties                            Meat/Poultry              30   $21,510.20 
        54 Tourtihre                                Meat/Poultry              36    $5,121.00 
        55 Pbti chinois                             Meat/Poultry              33   $19,512.00 
        56 Gnocchi di nonna Alice                   Grains/Cereals            50   $45,121.20 
        57 Ravioli Angelo                           Grains/Cereals            23    $7,807.80 
        58 Escargots de Bourgogne                   Seafood                   18    $6,664.75 
        59 Raclette Courdavault                     Dairy Products            54   $76,296.00 
        60 Camembert Pierrot                        Dairy Products            51   $50,286.00 
        61 Sirop dirable                           Condiments                24   $16,438.80 
        62 Tarte au sucre                           Confections               48   $49,827.90 
        63 Vegie-spread                             Condiments                17   $17,696.30 
        64 Wimmers gute Semmelknvdel                Grains/Cereals            30   $23,009.00 
        65 Louisiana Fiery Hot Pepper Sauce         Condiments                32   $14,607.00 
        66 Louisiana Hot Spiced Okra                Condiments                 8    $3,519.00 
        67 Laughing Lumberjack Lager                Beverages                 10    $2,562.00 
        68 Scottish Longbreads                      Confections               34    $9,362.50 
        69 Gudbrandsdalsost                         Dairy Products            31   $24,307.20 
        70 Outback Lager                            Beverages                 39   $11,472.00 
        71 Flxtemysost                              Dairy Products            42   $20,876.50 
        72 Mozzarella di Giovanni                   Dairy Products            38   $25,738.80 
        73 Rvd Kaviar                               Seafood                   14    $4,200.00 
        74 Longlife Tofu                            Produce                   13    $2,566.00 
        75 Rhvnbrdu Klosterbier                     Beverages                 46    $8,650.55 
        76 Lakkalikvvri                             Beverages                 39   $16,794.00 
        77 Original Frankfurter grüne Soße          Condiments                38    $9,685.00 

 77 rows selected 


--QUESTION 6(d): Filter your results to show only those products which have net total sales > 45,000. 
--In this part, consider the discount (i.e., do not ignore it) while calculating total sales and give this column a heading of Net Total Sales. 
--Sort by net total sales so the product with the highest shows first.
select od.productid, p.productname, pl.pl_name, count(od.productid) as "No of Orders", 
to_char(sum((od.unitprice * od.quantity) - (od.unitprice * od.quantity)*od.discount), '$999,999.99') as "Total Sales"
from corp.order_details od, corp.products p, corp.product_lines pl
where p.productid = od.productid
and pl.pl_id = p.pl_id
group by od.productid, p.productid, p.productname, pl.pl_name
having(sum((od.unitprice * od.quantity) - (od.unitprice * od.quantity)*od.discount) > 45000)
order by "Total Sales" desc;  

--EXPLANATION: The query is virtually identical with only the filtering being applied by the 
--use of a HAVING condition. Although, to do this accurately, the discount needs to be applied
--to each product based on the discounts applied for entries in the order_details table. This 
--discount is a percentage subtracted from the line price (unitprice * quantity). Thus, the 
--discount has to be computed and then subtracted from the line price. The HAVING filter is applied
--to the groupings yielding the proper results.

--OUTPUT:

 PRODUCTID PRODUCTNAME                              PL_NAME         No of Orders Total Sales
---------- ---------------------------------------- --------------- ------------ ------------
        38 Ctte de Blaye                            Beverages                 24  $141,396.73 
        29 Thüringer Rostbratwurst                  Meat/Poultry              32   $80,368.67 
        59 Raclette Courdavault                     Dairy Products            54   $71,155.70 
        62 Tarte au sucre                           Confections               48   $47,234.97 
        60 Camembert Pierrot                        Dairy Products            51   $46,825.48