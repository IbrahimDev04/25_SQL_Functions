CREATE DATABASE TaskSQL_4

USE TaskSQL_4

CREATE TABLE Users
(
	Id INT IDENTITY PRIMARY KEY,
	[Name] NVARCHAR(64) NOT NULL,
	Surname NVARCHAR(64) DEFAULT 'XXX',
	Username VARCHAR(12) NOT NULL UNIQUE,
	[Password] VARCHAR(21) NOT NULL,
	Gender BIT NOT NULL
)

CREATE TABLE Artists
(
	Id INT IDENTITY PRIMARY KEY,
	[Name] NVARCHAR(64) NOT NULL,
	Surname NVARCHAR(64) DEFAULT 'XXX',
	BirthDay DATE NOT NULL,
	Gender BIT NOT NULL
)

CREATE TABLE Categories
(
	Id INT IDENTITY PRIMARY KEY,
	[Name] VARCHAR(64) NOT NULL UNIQUE
)

CREATE TABLE Musics
(
	Id INT IDENTITY PRIMARY KEY,
	[Name] VARCHAR(64) NOT NULL UNIQUE,
	Duration VARCHAR(5) NOT NULL,
	ArtistId INT CONSTRAINT FK_Artist FOREIGN KEY REFERENCES Artists(Id),
	CategoryId INT CONSTRAINT FK_Category FOREIGN KEY REFERENCES Categories(Id)
)

CREATE TABLE Playlists
(
	Id INT IDENTITY PRIMARY KEY,
	UserId INT CONSTRAINT FK_Useraaa FOREIGN KEY REFERENCES Users(Id),
	MusicId INT CONSTRAINT FK_Musicaaa FOREIGN KEY REFERENCES Musics(Id)
)


INSERT INTO Users VALUES
(N'Ibrahim',N'Xuşməndi','brhma016','323fasf332w',1),(N'Qərib',N'Qəribzadə','qarib016','3233424332w',1),(N'Şahin',N'Əlizadə','sahin016','323fasf332w',1)

INSERT INTO Artists VALUES
('Rammstein','XXX','5/2/1994',1),('Justin','Bieber','1/3/1994',1)

INSERT INTO Categories VALUES
('Metalic'),('Rock'),('Pop'),('Rap')

INSERT INTO Musics VALUES
('Sorry','3;19',2,2),('Sonne', '4:06', 1,1),('Never say never','3:47',2,4)

INSERT INTO Playlists VALUES
(1,1),(1,2),(2,1)



CREATE VIEW CallDetail AS 
SELECT m.[Name] AS MusicName, m.Duration AS Duration, c.[Name] AS Category, a.[Name] + ' ' + a.Surname AS Fullname FROM Categories AS c
JOIN Musics AS m
ON m.CategoryId=c.Id
JOIN Artists AS a
ON a.Id=m.ArtistId;
	
SELECT * FROM CallDetail

SELECT u.[Name] + ' ' + u.Surname AS Fullname, m.[Name] AS MusicName  FROM Users AS u
JOIN Playlists AS p
ON p.UserId=u.Id
JOIN Musics AS m
ON u.Id=p.MusicId

SELECT * FROM Musics AS m
ORDER BY m.Duration ASC

SELECT TOP 1 Artists.Name + ' ' + Artists.Surname AS Fullname, COUNT(*) AS NumOfSongs
FROM Artists
JOIN Musics ON Artists.Id = Musics.ArtistID
GROUP BY Artists.Name, Artists.Surname
ORDER BY NumOfSongs DESC;