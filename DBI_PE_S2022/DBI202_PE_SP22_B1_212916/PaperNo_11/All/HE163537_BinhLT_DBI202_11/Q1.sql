create table Albums(AlbumID int primary key, 
Name nvarchar(50), Company nvarchar(100), ReleaseDate Date)

create table Tracks(TrackID int primary key,
AlbumID int foreign key references Albums(AlbumID), 
Name nvarchar(200), Duration int)

create table Artists(ArtistID int primary key,
Name nvarchar(100), Country nvarchar(50), Gender char(1))

create table Participate(ArtistID int foreign key references Artists(ArtistID),
TrackID int foreign key references Tracks(TrackID))










