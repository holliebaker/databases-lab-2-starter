DROP TABLE IF EXISTS Item;
CREATE TABLE Item (
ItemName VARCHAR (30) NOT NULL,
ItemType CHAR(1) NOT NULL,
ItemColour VARCHAR(10),
PRIMARY KEY (ItemName));

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
EmployeeNumber SMALLINT UNSIGNED NOT NULL ,
EmployeeName VARCHAR(10) NOT NULL ,
EmployeeSalary INTEGER UNSIGNED NOT NULL ,
DepartmentName VARCHAR(10) NOT NULL REFERENCES
Department,
BossNumber SMALLINT UNSIGNED NOT NULL REFERENCES
Employee,
PRIMARY KEY (EmployeeNumber));

DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
DepartmentName VARCHAR(10) NOT NULL,
DepartmentFloor SMALLINT UNSIGNED NOT NULL,
DepartmentPhone SMALLINT UNSIGNED NOT NULL,
EmployeeNumber SMALLINT UNSIGNED NOT NULL REFERENCES
Employee,
PRIMARY KEY (DepartmentName));

DROP TABLE IF EXISTS Sale;
CREATE TABLE Sale (
SaleNumber INTEGER UNSIGNED NOT NULL,
SaleQuantity SMALLINT UNSIGNED NOT NULL DEFAULT 1,
ItemName VARCHAR(30) NOT NULL REFERENCES Item,
DepartmentName VARCHAR(10) NOT NULL REFERENCES
Department,
PRIMARY KEY (SaleNumber));

DROP TABLE IF EXISTS Supplier;
CREATE TABLE Supplier (
SupplierNumber INTEGER UNSIGNED NOT NULL,
SupplierName VARCHAR(30) NOT NULL,
PRIMARY KEY (SupplierNumber));

DROP TABLE IF EXISTS Delivery;
CREATE TABLE Delivery (
DeliveryNumber INTEGER UNSIGNED NOT NULL,
DeliveryQuantity SMALLINT UNSIGNED NOT NULL DEFAULT 1,
ItemName VARCHAR(30) NOT NULL REFERENCES Item,
DepartmentName VARCHAR(10) NOT NULL REFERENCES
Department,
SupplierNumber INTEGER UNSIGNED NOT NULL REFERENCES
Supplier,
PRIMARY KEY (DeliveryNumber));

.table

.separator "\t"
.import delivery.txt Delivery
.import department.txt Department
.import employee.txt Employee
.import item.txt Item
.import sale.txt Sale
.import supplier.txt Supplier