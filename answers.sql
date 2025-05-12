# Question 1
-- Create a new normalized table
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(100)
);

-- Insert normalized data
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

-- Select the transformed table
SELECT * FROM ProductDetail_1NF;



# Qustion 2
Step 1: Create a Customers Table (CustomerID, CustomerName)

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Insert distinct customers
INSERT INTO Customers (CustomerID, CustomerName)
VALUES 
    (1, 'John Doe'),
    (2, 'Jane Smith'),
    (3, 'Emily Clark');

Step 2: Create an Orders Table (OrderID, CustomerID)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert unique orders with customer mapping
INSERT INTO Orders (OrderID, CustomerID)
VALUES 
    (101, 1),
    (102, 2),
    (103, 3);

Step 3: Create an OrderDetails Table (OrderID, Product, Quantity)
CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert order details
INSERT INTO OrderDetails (OrderID, Product, Quantity)
VALUES 
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);
