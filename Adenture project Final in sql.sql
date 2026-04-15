create database Adventure_Work_project;
use Adventure_Work_project;

#==========================create table FactInternetSales ===================================================#
CREATE TABLE FactInternetSales (
    ProductKey INT,
    OrderDateKey INT,
    DueDateKey INT,
    ShipDateKey INT,
    CustomerKey INT,
    PromotionKey INT,
    CurrencyKey INT,
    SalesTerritoryKey INT,
    SalesOrderNumber VARCHAR(20),
    SalesOrderLineNumber INT,
    RevisionNumber INT,
    OrderQuantity INT,
    UnitPrice DECIMAL(10,2),
    ExtendedAmount DECIMAL(12,2),
    UnitPriceDiscountPct DECIMAL(5,2),
    DiscountAmount DECIMAL(12,2),
    ProductStandardCost DECIMAL(12,4),
    TotalProductCost DECIMAL(12,4),
    SalesAmount DECIMAL(12,2),
    TaxAmt DECIMAL(12,4),
    Freight DECIMAL(12,4),
    OrderDate INT,
    DueDate INT,
    ShipDate INT
);

select * from FactInternetSales ;
SHOW VARIABLES LIKE 'secure_file_priv';

#==========================Importing FactInternetSales CSV File===========================

LOAD DATA INFILE 'D:/ProgramData/MySQL/MySQL Server 8.0/Uploads/FactInternetSales.csv'
INTO TABLE FactInternetSales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
ProductKey, OrderDateKey, DueDateKey, ShipDateKey, CustomerKey,
PromotionKey, CurrencyKey, SalesTerritoryKey, SalesOrderNumber,
SalesOrderLineNumber, RevisionNumber, OrderQuantity, UnitPrice,
ExtendedAmount, UnitPriceDiscountPct, DiscountAmount, ProductStandardCost,
TotalProductCost, SalesAmount, TaxAmt, Freight, OrderDate, DueDate, ShipDate
);

select count(*) from FactInternetSales;

#==========================create table Fact_Internet_Sales_New ===================================================#
CREATE TABLE Fact_Internet_Sales_New (
    ProductKey INT,
    OrderDateKey INT,
    DueDateKey INT,
    ShipDateKey INT,
    CustomerKey INT,
    PromotionKey INT,
    CurrencyKey INT,
    SalesTerritoryKey INT,
    SalesOrderNumber VARCHAR(20),
    SalesOrderLineNumber INT,
    RevisionNumber INT,
    OrderQuantity INT,
    UnitPrice DECIMAL(10,2),
    ExtendedAmount DECIMAL(12,2),
    UnitPriceDiscountPct DECIMAL(5,2),
    DiscountAmount DECIMAL(12,2),
    ProductStandardCost DECIMAL(12,4),
    TotalProductCost DECIMAL(12,4),
    SalesAmount DECIMAL(12,2),
    TaxAmt DECIMAL(12,4),
    Freight DECIMAL(12,4),
    OrderDate INT,
    DueDate INT,
    ShipDate INT
);

select * from Fact_Internet_Sales_New;

#==========================Importing FactInternetSales CSV File===========================

LOAD DATA INFILE 'D:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Fact_Internet_Sales_New.csv'
INTO TABLE  `Fact_Internet_Sales_New` 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
ProductKey, OrderDateKey, DueDateKey, ShipDateKey, CustomerKey,
PromotionKey, CurrencyKey, SalesTerritoryKey, SalesOrderNumber,
SalesOrderLineNumber, RevisionNumber, OrderQuantity, UnitPrice,
ExtendedAmount, UnitPriceDiscountPct, DiscountAmount, ProductStandardCost,
TotalProductCost, SalesAmount, TaxAmt, Freight, OrderDate, DueDate, ShipDate
);

select count(*) from Fact_Internet_Sales_New;


create table Fact_sales as 
select * from  FactInternetSales
union all
select * from Fact_Internet_Sales_New;

select * from Fact_sales;
select count(*) from Fact_sales;


#==========================create table DimCustomer ===================================================#
CREATE TABLE DimCustomer (
    CustomerKey INT PRIMARY KEY,
    GeographyKey INT,
    CustomerAlternateKey VARCHAR(50),
    FirstName  VARCHAR(50) CHARACTER SET utf8mb4,
    LastName VARCHAR(50),
    BirthDate INT,
    MaritalStatus CHAR(1),
    Gender CHAR(1),
    EmailAddress VARCHAR(150),
    YearlyIncome INT,
    TotalChildren INT,
    NumberChildrenAtHome INT,
    EnglishEducation VARCHAR(50),
    EnglishOccupation VARCHAR(50),
    HouseOwnerFlag TINYINT,
    NumberCarsOwned TINYINT,
    DateFirstPurchase INT,
    CommuteDistance VARCHAR(20)
);
drop table DimCustomer;
select * from DimCustomer;

#==========================Importing DimCustomer CSV File===========================

LOAD DATA INFILE 'D:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Dimcustomer.csv'
INTO TABLE DimCustomer
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
CustomerKey, GeographyKey, CustomerAlternateKey, FirstName, LastName, BirthDate, MaritalStatus, Gender, EmailAddress,
YearlyIncome, TotalChildren, NumberChildrenAtHome, EnglishEducation, EnglishOccupation, HouseOwnerFlag,
NumberCarsOwned, DateFirstPurchase, CommuteDistance
);

select count(*) from Dimcustomer;
SET GLOBAL local_infile = 1;



select count(*) from DimProduct;

desc DimProduct;
select * from DimProduct;


set sql_safe_updates=0;

UPDATE DimProduct
SET `Unit price` = NULL
WHERE TRIM(`Unit price`) = '' OR `Unit price` IS NULL;

ALTER TABLE DimProduct
CHANGE COLUMN `Unit_price` UnitPrice DECIMAL(10,2);

ALTER TABLE DimProduct
CHANGE COLUMN `Unit price` Unit_price DECIMAL(10,2);

ALTER TABLE DimProduct
CHANGE COLUMN ProductAlternateKey ProductAlternateKey VARCHAR(50);


UPDATE DimProduct
SET `ListPrice` = NULL
WHERE TRIM(`ListPrice`) = '' OR `ListPrice` IS NULL;

ALTER TABLE DimProduct
CHANGE COLUMN `ListPrice` ListPrice DECIMAL(10,2);


select * from fact_sales;
select * from dimproductcategory;
select * from dimproductsubcategory;
select * from Dimcustomer;
select * from dimproduct;
select * from Dimdate;
desc Dimdate;
select count(*) from Dimdate;

UPDATE Dimdate
SET FullDateAlternateKey = STR_TO_DATE(FullDateAlternateKey, '%d-%m-%Y');

SELECT DATE_ADD('1899-12-30', INTERVAL 42004 DAY);

select * from fact_sales;
desc fact_sales;

#==================================OrderDate===========================================#
ALTER TABLE fact_sales
ADD COLUMN OrderDate_new DATE;

UPDATE fact_sales
SET OrderDate_new = DATE_ADD('1899-12-30', INTERVAL OrderDate DAY);

ALTER TABLE fact_sales
DROP COLUMN OrderDate;

ALTER TABLE fact_sales
CHANGE OrderDate_new OrderDate DATE;

#=================================DueDate============================================#
ALTER TABLE fact_sales
ADD COLUMN DueDate_new DATE;

UPDATE fact_sales
SET DueDate_new = DATE_ADD('1899-12-30', INTERVAL DueDate DAY);

ALTER TABLE fact_sales
DROP COLUMN DueDate;

ALTER TABLE fact_sales
CHANGE DueDate_new DueDate DATE;


#======================================ShipDate========================================#
ALTER TABLE fact_sales
ADD COLUMN ShipDate_new DATE;

UPDATE fact_sales
SET ShipDate_new = DATE_ADD('1899-12-30', INTERVAL ShipDate DAY);

ALTER TABLE fact_sales
DROP COLUMN ShipDate;

ALTER TABLE fact_sales
CHANGE ShipDate_new ShipDate DATE;

select * from fact_sales;
select * from dimproductcategory;
select * from dimproductsubcategory;
select * from Dimcustomer;
select * from dimproduct;
select * from Dimdate;

#calcuate the following fields from the Orderdatekey field ( First Create a Date Field from Orderdatekey)

ALTER TABLE fact_sales
ADD COLUMN Year INT,
ADD COLUMN MonthNo INT,
ADD COLUMN MonthFullName VARCHAR(20),
ADD COLUMN Quarter VARCHAR(2),
ADD COLUMN YearMonth VARCHAR(10),
ADD COLUMN WeekdayNo INT,
ADD COLUMN WeekdayName VARCHAR(20),
ADD COLUMN FinancialMonth INT,
ADD COLUMN FinancialQuarter VARCHAR(2);


UPDATE fact_sales
SET 
    Year = YEAR(OrderDate),
    MonthNo = MONTH(OrderDate),
    MonthFullName = MONTHNAME(OrderDate),
    Quarter = CONCAT('Q', QUARTER(OrderDate)),
    YearMonth = DATE_FORMAT(OrderDate, '%Y-%b'),
    WeekdayNo = DAYOFWEEK(OrderDate),
    WeekdayName = DAYNAME(OrderDate),

    FinancialMonth = CASE 
        WHEN MONTH(OrderDate) >= 4 THEN MONTH(OrderDate) - 3
        ELSE MONTH(OrderDate) + 9
    END,

    FinancialQuarter = CASE 
        WHEN MONTH(OrderDate) BETWEEN 4 AND 6 THEN 'Q1'
        WHEN MONTH(OrderDate) BETWEEN 7 AND 9 THEN 'Q2'
        WHEN MONTH(OrderDate) BETWEEN 10 AND 12 THEN 'Q3'
        ELSE 'Q4'
    END;

ALTER TABLE fact_sales
ADD COLUMN Profit DECIMAL(10,2);

UPDATE fact_sales
SET TotalProductCost = ROUND(TotalProductCost, 2);

select * from fact_sales;


UPDATE fact_sales
SET Profit = SalesAmount - TotalProductCost;

#++++++++++++++++++++++++++++++++++++Sales Overview+++++++++++++++++++++++++++++++++++++++#
#=========================== Monthly Sales Trends=========================================#
select MonthFullName,
    CONCAT(ROUND(SUM(SalesAmount)/1000000, 2), ' M') AS TotalSales
FROM fact_sales
group by MonthFullName
order by MonthFullName;

#=========================Yearly Sales trends============================================#
SELECT 
    Year,
    CONCAT(ROUND(SUM(SalesAmount)/1000000, 2), ' M') AS TotalSales
FROM fact_sales
GROUP BY Year
ORDER BY SUM(SalesAmount) DESC;

#============================Quarterwise Sales=======================================#
SELECT 
    Quarter,
    CONCAT(ROUND(SUM(SalesAmount)/1000000, 2), ' M') AS TotalSales
FROM fact_sales
GROUP BY Quarter
ORDER BY SUM(SalesAmount) DESC;


select * from fact_sales;
select * from dimproduct;

#===========================Yearwise Sales And Production Amount========================#

select Year,
ROUND(SUM(SalesAmount)/1000000, 2) AS Total_Sales,
    ROUND(SUM(TotalProductCost)/1000000, 2) AS Total_ProductionCost
FROM fact_sales
group by Year;

#=======================Yearly Profit=======================================#

SELECT 
    YEAR(OrderDate) AS Year,
    concat(ROUND(SUM(SalesAmount - TotalProductCost)/1000000, 2), ' M')  AS Profit
FROM fact_sales
GROUP BY YEAR(OrderDate)
ORDER BY YEAR(OrderDate) ;


#++++++++++++++++++++++++++++++++Product Analysis++++++++++++++++++++++++++++++++++++++++++++++++++++#
select * from fact_sales ;
select * from dimproduct;

#============================Top 5 Product by Profit=================================================#
select p.EnglishProductName,
concat(Round(sum(f.profit)/1000),' K') as Profit
from fact_sales f join dimproduct  p
on f.productkey=p.productkey
group by p.EnglishProductName
order by sum(f.profit)  desc limit 5;

#================================Top 5 Sales by Subcategory============================================#
select s.EnglishProductSubcategoryName,
concat(Round(Sum(f.SalesAmount)/1000000, 2), ' M') as Total_Sales
from fact_sales as f join dimproduct as p
on f.productkey=p.productkey join
dimproductsubcategory as s 
on p.ProductSubcategoryKey=s.ProductSubcategoryKey
group by s.EnglishProductSubcategoryName
order by Sum(f.SalesAmount) desc limit 5;

#============================Top 5 Product by category===============================================#

select c.EnglishProductCategoryName,
concat(Round(Sum(f.SalesAmount)/1000000, 2), ' M') as Total_Sales
from fact_sales as f join dimproduct as p
on f.productkey=p.productkey join
dimproductsubcategory as s 
on p.ProductSubcategoryKey=s.ProductSubcategoryKey
join dimproductcategory as c 
on s.ProductCategoryKey=c.ProductCategoryKey
group by c.EnglishProductCategoryName
order by Sum(f.SalesAmount) desc limit 5;

#===============================Top 5 sales by color==================================================#

select p.color,
concat(Round(Sum(f.SalesAmount)/1000000, 2), ' M') as Total_Sales
from fact_sales as f join dimproduct as p 
on f.productkey=p.productkey
group by p.color
order by Sum(f.SalesAmount) desc limit 5;

#============================Top 10 Product by Sales=================================================#
select p.EnglishProductName,
concat(Round(sum(f.salesAmount)/1000000,2),'M') as Total_Sales
from fact_sales f join dimproduct  p
on f.productkey=p.productkey
group by p.EnglishProductName
order by sum(f.salesAmount)  desc limit 10;
#==================================KPI================================================================#

#----------------------------Total_Sales------------------------------------------------------------#
select 
concat(ROUND(SUM(SalesAmount)/1000000, 0),'M') AS Total_Sales
from fact_sales;

#-----------------------Total_Profit------------------------------------------------------------------#
select 
concat(ROUND(SUM(Profit)/1000000, 0),'M') AS Total_Sales
from fact_sales;

#----------------------Total_Customer-----------------------------------------------------------------#
SELECT CONCAT(ROUND(18484/1000, 0), 'K') AS Total_Customer;

#-----------------------Profit_Margin-----------------------------------------------------------------#
SELECT 
    concat(ROUND(SUM(SalesAmount - TotalProductCost) / SUM(SalesAmount) * 100, 2),'%') AS ProfitMargin
FROM fact_sales;



