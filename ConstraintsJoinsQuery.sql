CREATE DATABASE Constraints_Joins

USE Constraints_Joins

CREATE TABLE Notebooks(
	[Id] int PRIMARY KEY IDENTITY,
	[Name] nvarchar(30) NOT NULL,
	[Price] int DEFAULT 200
)

CREATE TABLE Brand(
	[Id] int PRIMARY KEY IDENTITY,
	[Name] nvarchar(30) CHECK(LEN([Name]) >= 3)
)

ALTER TABLE Notebooks
ADD [Brand_Id] int FOREIGN KEY REFERENCES Brand(Id)

INSERT Brand
VALUES
('Asus'),
('Lenovo'),
('Mac')

INSERT Notebooks([Name], [Price], [Brand_Id])
VALUES
('Vivabook', 1500, 3),
('Legion', 1800, 4),
('MacBook Air', 2000, 5)

SELECT n.Name AS Name, b.Name AS BrandName, n.Price AS Price FROM Notebooks as n
INNER JOIN Brand as b
on n.Brand_Id = b.Id

SELECT * FROM Notebooks as n
INNER JOIN Brand as b
on n.Brand_Id = b.Id
WHERE n.Name LIKE '%a%'

SELECT * FROM Notebooks as n
INNER JOIN Brand as b
on n.Brand_Id = b.Id
WHERE n.Price > 100 AND n.Price < 500 OR n.Price > 1000