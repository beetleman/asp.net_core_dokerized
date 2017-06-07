CREATE DATABASE APP_DB;
GO

USE APP_DB;
GO

CREATE TABLE Genders (
  GenderID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(100) NOT NULL UNIQUE
);
GO

CREATE TABLE Continents (
  ContinentID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(100) NOT NULL UNIQUE,
  Area INT NOT NULL
);
GO

CREATE TABLE Countries (
  CountryID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(100) NOT NULL UNIQUE,
  Capital NVARCHAR(100) NOT NULL,
  Area INT NOT NULL,
  ContinentID INT NOT NULL FOREIGN KEY REFERENCES Continents(ContinentID)
);
GO

CREATE TABLE Humans (
  HumanID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(100) NOT NULL,
  NickName NVARCHAR(100),
  SurName NVARCHAR(100) NOT NULL,
  CountryID INT NOT NULL FOREIGN KEY REFERENCES Countries(CountryID),
  GenderID INT NOT NULL FOREIGN KEY REFERENCES Genders(GenderID)
);
GO

SET IDENTITY_INSERT Genders ON;
INSERT INTO Genders (GenderID, Name)
VALUES (0, N'Female'),
       (1, N'Male');
SET IDENTITY_INSERT Genders OFF;
GO

INSERT INTO Genders (Name)
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
INSERT INTO Continents (ContinentId, Name, Area)
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
INSERT INTO Countries (CountryID, Name, Capital, Area, ContinentID)
VALUES (0, N'Poland', N'Warszawa', 312679, 4),
       (1, N'Moldova', N'Chișinău', 33846, 4 );
SET IDENTITY_INSERT Countries OFF;
GO

INSERT INTO Humans (Name, SurName, CountryID, GenderID)
VALUES (N'Mateusz', N'Probachta', 0, 1);
GO
