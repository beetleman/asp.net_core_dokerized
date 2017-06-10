PRINT 'setup: start'
IF EXISTS (select * from sys.databases where name = 'APP_DB') BEGIN
    PRINT 'setup: db exist'
    set noexec on;
END


CREATE DATABASE APP_DB;
GO

USE APP_DB;
GO

CREATE TABLE Genders (
  GenderID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  GenderName NVARCHAR(100) NOT NULL UNIQUE
);
GO

CREATE TABLE Continents (
  ContinentID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  ContinentName NVARCHAR(100) NOT NULL UNIQUE,
  ContinentArea INT NOT NULL
);
GO

CREATE TABLE Countries (
  CountryID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  CountryName NVARCHAR(100) NOT NULL UNIQUE,
  CountryCapital NVARCHAR(100) NOT NULL,
  CountryArea INT NOT NULL,
  ContinentID INT NOT NULL FOREIGN KEY REFERENCES Continents(ContinentID)
);
GO

CREATE TABLE Humans (
  HumanID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  HumanName NVARCHAR(100) NOT NULL,
  HumanSurName NVARCHAR(100) NOT NULL,
  HumanNickName NVARCHAR(100) NOT NULL DEFAULT '',
  CountryID INT NOT NULL FOREIGN KEY REFERENCES Countries(CountryID),
  GenderID INT NOT NULL FOREIGN KEY REFERENCES Genders(GenderID)
);
GO

SET IDENTITY_INSERT Genders ON;
INSERT INTO Genders (GenderID, GenderName)
VALUES (0, N'Female'),
       (1, N'Male');
SET IDENTITY_INSERT Genders OFF;
GO

INSERT INTO Genders (GenderName)
VALUES (N'Agender'),
       (N'Androgyne'),
       (N'Androgynous'),
       (N'Bigender'),
       (N'Cis'),
       (N'Cisgender'),
       (N'Cis Female'),
       (N'Cis Male'),
       (N'Cis Man'),
       (N'Cis Woman'),
       (N'Cisgender Female'),
       (N'Cisgender Male'),
       (N'Cisgender Man'),
       (N'Cisgender Woman'),
       (N'Female to Male'),
       (N'FTM'),
       (N'Gender Fluid'),
       (N'Gender Nonconforming'),
       (N'Gender Questioning'),
       (N'Gender Variant'),
       (N'Genderqueer'),
       (N'Intersex'),
       (N'Male to Female'),
       (N'MTF'),
       (N'Neither'),
       (N'Neutrois'),
       (N'Non-binary'),
       (N'Other'),
       (N'Pangender'),
       (N'Trans'),
       (N'Trans*'),
       (N'Trans Female'),
       (N'Trans* Female'),
       (N'Trans Male'),
       (N'Trans* Male'),
       (N'Trans Man'),
       (N'Trans* Man'),
       (N'Trans Person'),
       (N'Trans* Person'),
       (N'Trans Woman'),
       (N'Trans* Woman'),
       (N'Transfeminine'),
       (N'Transgender'),
       (N'Transgender Female'),
       (N'Transgender Male'),
       (N'Transgender Man'),
       (N'Transgender Person'),
       (N'Transgender Woman'),
       (N'Transmasculine'),
       (N'Transsexual'),
       (N'Transsexual Female'),
       (N'Transsexual Male'),
       (N'Transsexual Man'),
       (N'Transsexual Person'),
       (N'Transsexual Woman'),
       (N'Two-Spirit');
GO

SET IDENTITY_INSERT Continents ON;
INSERT INTO Continents (ContinentId, ContinentName, ContinentArea)
VALUES (0, N'Asia', 44579000),
       (1, N'South America', 17819000),
       (2, N'North America', 24256000),
       (3, N'Africa', 30065000),
       (4, N'Europe', 9938000),
       (5, N'Antarctica', 13209000),
       (6, N'Australia', 7687000);
SET IDENTITY_INSERT Continents OFF;
GO

SET IDENTITY_INSERT Countries ON;
INSERT INTO Countries (CountryID, CountryName, CountryCapital, CountryArea, ContinentID)
VALUES (0, N'Poland', N'Warszawa', 312679, 4),
       (1, N'Moldova', N'Chișinău', 33846, 4 );
SET IDENTITY_INSERT Countries OFF;
GO

INSERT INTO Humans (HumanName, HumanSurName, CountryID, GenderID)
VALUES (N'Mateusz', N'Probachta', 0, 1);
GO


-- Views
CREATE VIEW CountriesDetails
AS
  SELECT c.*,
         ContinentName
         FROM Countries c
  JOIN Continents
  ON c.ContinentID = Continents.ContinentID;
GO

CREATE VIEW HumansDetails
AS
  SELECT h.*,
         CountryName,
         ContinentName,
         GenderName
         FROM Humans h
  JOIN CountriesDetails c
  ON h.CountryID = c.CountryID
  JOIN Genders g
  ON h.GenderID = g.GenderID;
GO

-- Procedures

-- -- humans
CREATE PROCEDURE getHumansDetails
AS
  SELECT * FROM HumansDetails;
GO

CREATE PROCEDURE getHumanDetails @id INT
AS
  SELECT * FROM HumansDetails
  WHERE HumanID = @id;
GO

CREATE PROCEDURE createHuman
       @name NVARCHAR(100),
       @surName NVARCHAR(100),
       @countryID INT = 1,
       @genderID INT = 1
AS
  INSERT INTO Humans (HumanName, HumanSurName, CountryID, GenderID)
  VALUES (@name, @surName, @countryID, @genderID);
GO

-- -- countries
CREATE PROCEDURE getCountriesDetails
AS
  SELECT * FROM CountriesDetails;
GO

CREATE PROCEDURE getCountryDetails
       @id INT
AS
  SELECT * FROM CountriesDetails
  WHERE CountryID = @id;
GO

CREATE PROCEDURE createCounty
       @name NVARCHAR(100),
       @capital NVARCHAR(100),
       @area INT,
       @continentID INT = 1
AS
  INSERT INTO Countries (CountryName, CountryCapital, CountryArea, ContinentID)
  VALUES (@name, @capital, @area, @continentID)
GO

-- -- continents
CREATE PROCEDURE getContinentsDetails
AS
  SELECT * FROM Continents;
GO

CREATE PROCEDURE getContinentDetails
       @id INT
AS
  SELECT * FROM Continents
  WHERE ContinentID = @id;
GO

CREATE PROCEDURE createContinent
       @name NVARCHAR(100),
       @area INT
AS
  INSERT INTO Continents (ContinentName, ContinentArea)
  VALUES (@name, @area)
GO

-- -- genders
CREATE PROCEDURE getGandersDetails
AS
  SELECT * FROM Ganders;
GO

CREATE PROCEDURE getGanderDetails
       @id INT
AS
  SELECT * FROM Ganders
  WHERE GanderID = @id;
GO

CREATE PROCEDURE createGender
       @name NVARCHAR(100)
AS
  INSERT INTO Genders (GenderName)
  VALUES (@name)
GO

set noexec off;
PRINT 'setup: end'
