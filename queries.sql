-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select
  p.*,
  c.CategoryName,
  c.Description as [CategoryDescription],
  s.CompanyName as [SupplierName],
  s.Region as [SupplierRegion]
from [Product] p
join [Category] c on p.CategoryId = c.id
join [Supplier] s on s.id = p.SupplierId 

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT
  o.Id,
  s.CompanyName
from [Order] as o
INNER JOIN [Shipper] as s ON o.ShipVia = s.Id
  AND o.OrderDate < '2012-08-09' 
  
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT
  OrderDetail.Quantity,
  Product.ProductName
FROM [OrderDetail]
INNER JOIN Product ON OrderDetail.OrderId = 10251
  AND OrderDetail.ProductId = Product.Id
ORDER BY
  Product.ProductName
  
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT
  [Order].Id as [OrderId],
  [Customer].CompanyName,
  [Employee].LastName as [CustomerLastName]
FROM [Order]
INNER JOIN [Customer] on [Order].CustomerId = [Customer].Id
INNER JOIN [Employee] on [Order].EmployeeId = [Employee].Id