Create database ConstrainJoinUnion

Use ConstrainJoinUnion

Create Table Students
(
	Id int identity Primary Key,
	FullName nvarchar(100) Not Null Check(Len(FullName) > 3),
	Salary int Not Null Check(Salary > 0),
	Email nvarchar(100) Not Null Unique,
	DepartmentId int  Foreign Key References Department(Id)
)
Create Table Department
(
	Id int identity Primary Key,
	Name nvarchar(100) Not Null Check(Len(Name) > 2)
)



Create Database Cars
Use Cars
Create Table Brands 
(
	Id int identity Primary Key,
	Name nvarchar(100) Not Null 
)

Create Table Notebooks  
(
	Id int identity Primary Key,
	Name nvarchar(100) Not Null,
	Price int Not Null
)
Create Table Phones   
(
	Id int identity Primary Key,
	Name nvarchar(100) Not Null,
	Price int Not Null
)
Alter Table Notebooks
Add BrandId int Foreign Key References Brands(Id)

Alter Table Phones
Add BrandId int Foreign Key References Brands(Id)

Insert Into Brands
Values
('Samsung'),
('Huawei'),
('Iphone'),
('Mac'),
('MSI'),
('HP'),
('Lenova')

Insert Into Notebooks
Values
('Air M2',2000,4),
('Macbook Pro',3200,4),
('Air M1',2100,4),
('Crosshair 17',3000,5),
('Pulse gl66',4250,5),
('Pavilion',3120,6),
('Elitebook',3050,6),
('Legion',2200,7),
('Ideapad',1755,7),
('Thinkpad',1999,7)


Insert Into Phones
Values
('Galaxy S20',800,1),
('Galaxy A51',720,1),
('Y9 Prime',990,2),
('Nova 9',829,2),
('12 Pro Max',2000,3),
('14 Pro',3300,3)
 
Select n.Name, b.Name BrandName, n.Price  from Notebooks n Join Brands b on n.BrandId=b.Id
 
Select p.Name, b.Name BrandName, p.Price  from Phones p Join Brands b on p.BrandId=b.Id

select n.Name from Notebooks n Join Brands b on n.BrandId=b.Id where b.Name like '%s%' 

Select * From Notebooks Where (Price Between 2000 And 5000) Or Price> 5000

Select * From Phones Where (Price Between 1000 And 1500) Or Price> 1500

Select b.Name as BrandName, COUNT(n.BrandId) as [Numbers of Notebook] from Notebooks n join Brands b on b.Id=n.BrandId Group by b.name

Select b.Name as BrandName, COUNT(p.BrandId) as [Numbers of Phones] from Phones p join Brands b on b.Id=p.BrandId Group by b.name


Select * From Brands b
Join Phones p
on p.BrandId= b.Id
Join Notebooks n
on n.BrandId=b.Id


select * from Notebooks n full Join Brands b on n.BrandId=b.Id
select * from Phones p full Join Brands b on p.BrandId=b.Id

select n.Id, n.Name,n.Price, b.Name as BrandName from Notebooks n Join Brands b on n.BrandId=b.Id
select p.Id, p.Name,p.Price, b.Name as BrandName from Phones p Join Brands b on p.BrandId=b.Id


select n.Id, n.Name,n.Price, b.Name as BrandName from Notebooks n Join Brands b on n.BrandId=b.Id where n.Price>1000
select p.Id, p.Name,p.Price, b.Name as BrandName from Phones p Join Brands b on p.BrandId=b.Id where p.Price>1000


select b.Name as BrandName , SUM(p.Price) as TotalPrice, COUNT(p.BrandId) as ProductCount from Phones p join Brands b on p.BrandId=b.Id Group by b.Name
select b.Name as BrandName , SUM(n.Price) as TotalPrice, COUNT(n.BrandId) as ProductCount from Notebooks n join Brands b on n.BrandId=b.Id Group by b.Name