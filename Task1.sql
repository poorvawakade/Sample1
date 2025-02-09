CREATE DATABASE Shope;
USE Shope;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50)
);


INSERT INTO Customers (CustomerID, Name, City) VALUES
(1, 'Alice', 'Mumbai'),
(2, 'Bob', 'Pune'),
(3, 'Charlie', 'Delhi'),
(4, 'David', 'Bangalore');


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO Orders (OrderID, CustomerID, Product) VALUES
(101, 1, 'Laptop'),
(102, 2, 'Mobile'),
(103, 3, 'Tablet'),
(104, 4, 'Monitor'); 

SELECT * FROM shope.orders;


	OrderID	 CustomerID	Product
	101	       1	    Laptop
	102	       2	    Mobile
	104	       4	    Monitor
	103	       3	    Tablet
        
			
SELECT * FROM shope.customers;

CustomerID	  Name	    City
1	        Alice	    Mumbai
2	        Bob	        Pune
3	        Charlie    	Delhi
4	        David	    Bangalore



/*INNER JOIN*/

SELECT Customers.CustomerID, Customers.Name, Customers.City, 
       Orders.OrderID, Orders.Product
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

CustomerID	Name	    City	    OrderID	    Product
1	        Alice	    Mumbai	    101	        Laptop
2	        Bob	        Pune	    102	        Mobile
3	        Charlie	    Delhi	    103         Tablet
4	        David	    Bangalore	104	        Monitor


/*LEFT JOIN*/

SELECT Customers.CustomerID, Customers.Name, Customers.City, 
       Orders.OrderID, Orders.Product
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

CustomerID	Name	    City	    OrderID	    Product
1	        Alice	    Mumbai	    101	        Laptop
2	        Bob	        Pune	    102	        Mobile
3	        Charlie	    Delhi	    103	        Tablet
4	        David	    Bangalore	104         Monitor



/*RIGHT JOIN*/

SELECT Customers.CustomerID, Customers.Name, Customers.City, 
       Orders.OrderID, Orders.Product
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

CustomerID	Name	    City	    OrderID	    Product
1	        Alice	    Mumbai	    101	        Laptop
2	        Bob	        Pune	    102	        Mobile
3	        Charlie	    Delhi	    103	        Tablet
4	        David	    Bangalore	104         Monitor


/*FULL JOIN (Using UNION)*/

SELECT Customers.CustomerID, Customers.Name, Customers.City, 
       Orders.OrderID, Orders.Product
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.CustomerID, Customers.Name, Customers.City, 
       Orders.OrderID, Orders.Product
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

CustomerID	Name	    City	    OrderID	    Product
1	        Alice	    Mumbai	    101	        Laptop
2	        Bob	        Pune	    102	        Mobile
3	        Charlie	    Delhi	    103	        Tablet
4	        David	    Bangalore	104         Monitor

