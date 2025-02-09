USE shope;

/*Using Window Function: RANK()*/

SELECT OrderID, CustomerID, Product,  
       RANK() OVER (PARTITION BY CustomerID ORDER BY OrderID ASC) AS OrderRank  
FROM Orders;


/* Each customer had only 1 order, so RANK() always showed 1. so lets add more values*/

INSERT INTO Orders (OrderID, CustomerID, Product) VALUES
(105, 2, 'Laptop'),
(106, 2, 'Mobile'),
(107, 3, 'Tablet'),
(108, 4, 'Monitor'); 

SELECT * FROM shope.orders; 

/* lets rune the query again*/


SELECT OrderID, CustomerID, Product,  
       RANK() OVER (PARTITION BY CustomerID ORDER BY OrderID ASC) AS OrderRank  
FROM Orders;

OrderID	CustomerID	Product	OrderRank
101	              1	Laptop	             1
102	              2	Mobile	             1
105	              2	Laptop	             2
106	              2	Mobile	             3
103	              3	Tablet	             1
107	              3	Tablet	             2
104	              4	Monitor	      1
108	              4	Monitor	      2


/* Using Subquery to find customers who ordered "Laptop" */

SELECT CustomerID, Name, City
FROM Customers  
WHERE CustomerID IN (  
    SELECT CustomerID FROM Orders  
    WHERE Product = 'Laptop');

CustomerID	Name	City
1	       Alice	Mumbai
2	       Bob	Pune

    
/* Using CTE to count total orders per customer */

 WITH OrderCounts AS (  
    SELECT CustomerID, COUNT(OrderID) AS TotalOrders  
    FROM Orders  
    GROUP BY CustomerID         
)  
SELECT Customers.CustomerID, Customers.Name, OrderCounts.TotalOrders  
FROM Customers  
JOIN OrderCounts ON Customers.CustomerID = OrderCounts.CustomerID;   

CustomerID	Name	TotalOrders
1	       Alice	       1
2	       Bob	       3
3	       Charlie	2
4	       David	       2



