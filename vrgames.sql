create database if not exists VRGAMES;

create table if not exists Users(
USERID int auto_increment,
Username varchar(50) not null,
email varchar(100),
Password varchar(100) not null,
date_of_birth date,
country varchar(50),
last_login datetime,
primary key (USERID)
);

create table if not exists Developer(
DeveloperId int auto_increment,
DEV_NAME varchar(50) not null,
HEADQUATER varchar(100),
DESCRIPTION varchar(100) not null,
WEBSITE varchar(100),

CONTACT_EMAIL varchar(100),
CONTACT_PHN double,

primary key (DeveloperId)
);

create table if not exists Games(
GameID int auto_increment,
gametitle varchar(50) not null,
description varchar(100),
genre varchar(100) not null,
price int,
Developerid int ,
avg_rating varchar(100),
NO_of_Downloads int,
release_date date,

foreign key(Developerid) references Developer (Developerid) 
ON UPDATE CASCADE ON DELETE SET NULL ,
primary key (GameID)
);

create table if not exists Reviews(
ReviewID int auto_increment,
gameID int ,
userID int,
reviewTEXT varchar(100),
rating int not null,
review date,
foreign key(userID) references Users (userID) 
ON UPDATE CASCADE ON DELETE SET NULL ,

foreign key(gameID) references Games (gameID) 
ON UPDATE CASCADE ON DELETE SET NULL ,
primary key (ReviewID)
);

 create table if not exists Transactions(
 TransactionID int auto_increment,
 userID int,
 gameID int, 
 TransactionDate date,
 Amount double,
foreign key (userID) references Users (USERID)
on update cascade on delete set null,

foreign key (gameID) references games (GameID)
on update cascade on delete set null,
primary key (TransactionID)
);

create table if not exists GamePlayData(
 GamePlayID int auto_increment,
 userID int,
 gameID int, 
 Session_start_time time,
 Session_end_time time,
 Duration time,
 Score double,
foreign key (userID) references Users (USERID)
on update cascade on delete set null,

foreign key (gameID) references games (GameID)
on update cascade on delete set null,
primary key (GamePlayID)
);

create table if not exists Wishlist(
 WishlistID int auto_increment,
 userID int,
 gameID int, 
 Date_Added date,
foreign key (userID) references Users (USERID)
on update cascade on delete set null,

foreign key (gameID) references games (GameID)
on update cascade on delete set null,
primary key (WishlistID)
);

create table if not exists Comments(
 CommentID int auto_increment,
 userID int,
 gameID int, 
 Comment_text Varchar(200),
 Comment_date date,
foreign key (userID) references Users (USERID)
on update cascade on delete set null,

foreign key (gameID) references games (GameID)
on update cascade on delete set null,
primary key (CommentID)
);


create table if not exists tags(
 TagID int auto_increment,
 Tag_Name varchar(50), 
primary key (TagID)
);

create table if not exists Game_tags(
GameTagID int auto_increment,
TagID int,
gameID int,
foreign key (TagID) references Tags (TagID)
on update cascade on delete set null,

foreign key (gameID) references Games (GameID)
on update cascade on delete set null,
primary key (GameTagID)
);

create table if not exists user_status(
USERID int,
subscription_status varchar(50),
account_open date,
foreign key (USERID) references Users (USERID)
on update cascade on delete set null
);
-- Inserting sample data into Users table
INSERT INTO Users (Username, email, Password, date_of_birth, country, last_login)
VALUES 
('ABDUL MANIO', 'ABDUL MANIO@example.com', 'password1', '1990-05-15', 'USA', '2024-05-01 08:30:00'),
('MISBAH HASSAN', 'MISBAH HASSAN2@example.com', 'password2', '1985-08-20', 'UK', '2024-04-25 10:15:00'),
('SYED HASSAN', 'SYED HASSAN@example.com', 'password3', '1998-03-10', 'Canada', '2024-05-01 15:45:00'),
('ABDUL RAFIU', 'ABDUL RAFIU@example.com', 'password4', '1989-06-24', 'Australia', '2024-05-09 08:30:00'),
('Afifa', 'afifa@example.com', 'password5', '1987-09-12', 'Germany', '2024-05-08 10:15:00'),
('SUHAIL', 'SUHAIL@example.com', 'password6', '1993-04-05', 'France', '2024-05-07 15:45:00'),
('MAIRAJ', 'MAIRAJ@example.com', 'password7', '1995-01-30', 'Brazil', '2024-05-01 08:30:00'),
('MAQSOOD', 'maqsood@example.com', 'password8', '1990-08-18', 'India', '2024-04-25 10:15:00'),
('qalandar', 'qalandar@example.com', 'password9', '1988-02-15', 'China', '2024-05-01 15:45:00'),
('aqsa', 'aqsa@example.com', 'password10', '1984-11-20', 'Russia', '2024-05-09 08:30:00'),
('muskan', 'muskan@example.com', 'password11', '1997-06-03', 'Italy', '2024-05-08 10:15:00'),
('rizwan', 'rizwan@example.com', 'password12', '1992-09-28', 'Spain', '2024-05-07 15:45:00'),
('mujeeb', 'mujeeb@example.com', 'password13', '1986-12-11', 'Netherlands', '2024-05-01 08:30:00'),
('prathna', 'pratHna@example.com', 'password14', '1983-03-26', 'South Korea', '2024-04-25 10:15:00'),
('urooj', 'urooj@example.com', 'password15', '1994-10-07', 'Canada', '2024-05-01 15:45:00'),
('Marina', 'marina@example.com', 'password16', '1987-02-18', 'UK', '2024-05-09 08:30:00'),
('irum', 'IRUM@example.com', 'password17', '1991-05-23', 'USA', '2024-05-08 10:15:00'),
('fatah', 'FATAH@example.com', 'password18', '1996-08-09', 'Japan', '2024-05-07 15:45:00'),
('aziz', 'aziz@example.com', 'password19', '1988-01-14', 'Sweden', '2024-05-01 08:30:00'),
('nawaz', 'nawaz@example.com', 'password20', '1985-04-03', 'Norway', '2024-04-25 10:15:00'),
('uzAIR', 'uzair@example.com', 'password21', '1993-07-30', 'Switzerland', '2024-05-01 15:45:00'),
('Farwa', 'farwa@example.com', 'john123', '1986-05-15', 'USA', '2024-05-01 08:30:00'),
('sara', 'sara@example.com', 'jane123', '1990-08-20', 'UK', '2024-04-25 10:15:00'),
('khadeeja', 'khadeeja@example.com', 'alex123', '1984-03-10', 'Canada', '2024-05-01 15:45:00'),
('hareem', 'hareem@example.com', 'emily123', '1995-06-24', 'Australia', '2024-05-09 08:30:00'),
('kashaf', 'kashaf@example.com', 'michael123', '1987-09-12', 'Germany', '2024-05-08 10:15:00'),
('nancy', 'nancy@example.com', 'sarah123', '1993-04-05', 'France', '2024-05-07 15:45:00'),
('humera', 'humera@example.com', 'david123', '1989-01-30', 'Brazil', '2024-05-01 08:30:00'),
('Tayyaba Abbas', 'tayyaba@example.com', 'jennifer123', '1992-08-18', 'India', '2024-04-25 10:15:00'),
('Atiya', 'atiya@example.com', 'william123', '1986-02-15', 'China', '2024-05-01 15:45:00'),
('Naila', 'Naila@example.com', 'laura123', '1990-11-20', 'Russia', '2024-05-09 08:30:00'),
('Aleena', 'aleena@example.com', 'robert123', '1983-06-03', 'Italy', '2024-05-08 10:15:00'),
('Hira', 'hira@example.com', 'oliver123', '1997-09-28', 'Spain', '2024-05-07 15:45:00'),
('zainab', 'zainab@example.com', 'emma123', '1988-12-11', 'Netherlands', '2024-05-01 08:30:00'),
('Zameera', 'zameera@example.com', 'daniel123', '1994-03-26', 'South Korea', '2024-04-25 10:15:00'),
('Summaiya', 'summaiya@example.com', 'sophia123', '1987-10-07', 'Canada', '2024-05-01 15:45:00'),
('Eman', 'eman@example.com', 'matthew123', '1996-02-18', 'UK', '2024-05-09 08:30:00'),
('yusra', 'yusra@example.com', 'amelia123', '1991-05-23', 'USA', '2024-05-08 10:15:00'),
('Maria Samee', 'Maria Samee@example.com', 'ethan123', '1984-08-09', 'Japan', '2024-05-07 15:45:00'),
('Sana Danish', 'sana@example.com', 'isabella123', '1998-01-14', 'Sweden', '2024-05-01 08:30:00'),
('Kainat Shoaib', 'kainat@example.com', 'dylan123', '1980-04-03', 'Norway', '2024-04-25 10:15:00'),
('Samee Hassan', 'samee@example.com', 'madison123', '1993-07-30', 'Switzerland', '2024-05-01 15:45:00'),
('Shoaib Hassan', 'shoaib@example.com', 'nathan123', '1989-10-17', 'Denmark', '2024-05-09 08:30:00'),
('Danish Ahmed', 'danish@example.com', 'hannah123', '1995-03-07', 'Argentina', '2024-05-08 10:15:00'),
('Wasay', 'wasay@example.com', 'jacob123', '1984-06-20', 'Portugal', '2024-05-07 15:45:00'),
('Waqar', 'waqar@example.com', 'mia123', '1990-09-13', 'Belgium', '2024-05-01 08:30:00'),
('Shafiu', 'shafiu@example.com', 'logan123', '1983-12-29', 'Finland', '2024-04-25 10:15:00'),
('Umair Ahmed', 'umair@example.com', 'amelia123', '1992-02-22', 'Austria', '2024-05-01 15:45:00'),
('Uroosa', 'uroosa@example.com', 'noah123', '1986-07-15', 'Greece', '2024-05-09 08:30:00'),
('Bushra', 'bushra@example.com', 'olivia123', '1980-10-10', 'Ireland', '2024-05-08 10:15:00'),
('Gungun', 'gungun@example.com', 'lucas123', '1997-01-25', 'Poland', '2024-05-07 15:45:00'),
('Zahra', 'zahra@example.com', 'ava123', '1985-04-12', 'Chile', '2024-05-01 08:30:00'),
('Masood', 'masoodexample.com', 'oliver123', '1998-07-07', 'Australia', '2024-04-25 10:15:00'),
('Noman', 'noman@example.com', 'emma123', '1987-12-02', 'Germany', '2024-05-01 15:45:00');


-- Inserting sample data into Developer table
INSERT INTO Developer (DEV_NAME, HEADQUATER, DESCRIPTION, WEBSITE, CONTACT_EMAIL, CONTACT_PHN)
VALUES 
('Ubisoft', 'Paris, France', 'Video game company', 'www.ubisoft.com', 'contact@ubisoft.com', 123456789),
('Electronic Arts', 'Redwood City, California, USA', 'Video game company', 'www.ea.com', 'contact@ea.com', 987654321),
('Rockstar Games', 'New York City, New York, USA', 'Video game company', 'www.rockstargames.com', 'contact@rockstargames.com', 555123456),
('Activision Blizzard', 'Santa Monica, California, USA', 'Video game company', 'www.activisionblizzard.com', 'contact@activisionblizzard.com', 888555123),
('Nintendo', 'Kyoto, Japan', 'Video game company', 'www.nintendo.com', 'contact@nintendo.com', 111222333),
('Sony Interactive Entertainment', 'San Mateo, California, USA', 'Video game company', 'www.playstation.com', 'contact@playstation.com', 444777999),
('Microsoft Studios', 'Redmond, Washington, USA', 'Video game company', 'www.xbox.com', 'contact@microsoft.com', 666999111),
('Square Enix', 'Tokyo, Japan', 'Video game company', 'www.square-enix.com', 'contact@square-enix.com', 222444666),
('Bethesda Game Studios', 'Rockville, Maryland, USA', 'Video game company', 'www.bethesda.net', 'contact@bethesda.net', 777111222),
('CD Projekt', 'Warsaw, Poland', 'Video game company', 'www.cdprojekt.com', 'contact@cdprojekt.com', 333666999);

-- Inserting sample data into Games table
INSERT INTO Games (gametitle, description, genre, price, Developerid, avg_rating, NO_of_Downloads, release_date)
VALUES 
('Assassins Creed Valhalla', 'Viking-themed action-adventure', 'Action, Adventure', 59, 7, '4.5', 1000000, '2020-11-10'),
('FIFA 21', 'Football simulation game', 'Sports', 59, 8, '4.2', 1500000, '2020-10-09'),
('Grand Theft Auto V', 'Action-adventure game', 'Action, Adventure', 29, 9, '4.8', 2000000, '2013-09-17'),
('Call of Duty: Warzone', 'Battle Royale game', 'Action', 0, 10, '4.6', 3000000, '2020-03-10'),
('The Legend of Zelda: Breath of the Wild', 'Action-adventure game', 'Action, Adventure', 59, 1, '4.9', 2500000, '2017-03-03'),
('The Last of Us Part II', 'Action-adventure game', 'Action, Adventure', 59, 2, '4.7', 1500000, '2020-06-19'),
('Minecraft', 'Sandbox video game', 'Adventure', 29, 3, '4.8', 5000000, '2009-05-17'),
('Final Fantasy VII Remake', 'Role-playing game', 'Role-playing', 59, 4, '4.6', 1000000, '2020-04-10'),
('Fallout 4', 'Action role-playing game', 'Action, RPG', 29, 5, '4.4', 1500000, '2015-11-10'),
('The Witcher 3: Wild Hunt', 'Action role-playing game', 'Action, RPG', 29, 6, '4.9', 3000000, '2015-05-19');

INSERT INTO Reviews (gameID, userID, reviewTEXT, rating, review)
VALUES
    (11, 1, 'Great game! Highly recommended.', 5, '2024-05-01'),
    (12, 2, 'Awesome graphics and gameplay.', 4, '2024-05-02'),
    (13, 3, 'Could be better, but still enjoyable.', 3, '2024-05-03'),
    (14, 4, 'Disappointed with the storyline.', 2, '2024-05-04'),
    (15, 5, 'One of the best games I''ve played.', 5, '2024-05-05'),
    (16, 6, 'Lacks innovation, but decent overall.', 3, '2024-05-06'),
    (17, 7, 'Addictive gameplay, worth every penny.', 4, '2024-05-07'),
    (18, 8, 'The multiplayer mode is fantastic.', 5, '2024-05-08'),
    (19, 9, 'Not my cup of tea, but might appeal to others.', 2, '2024-05-09'),
    (20, 10, 'The graphics are stunning!', 5, '2024-05-10'),
    (20, 11, 'Good storyline, keeps you engaged.', 4, '2024-05-11'),
    (19, 12, 'Could use some improvements in controls.', 3, '2024-05-12'),
    (18, 13, 'Highly immersive experience.', 4, '2024-05-13'),
    (17, 14, 'A must-play for any gamer.', 5, '2024-05-14'),
    (16, 15, 'Better than expected.', 4, '2024-05-15'),
    (15, 16, 'Great replay value.', 4, '2024-05-16'),
    (14, 17, 'The AI needs refinement.', 3, '2024-05-17'),
    (13, 28, 'Mediocre at best.', 2, '2024-05-18'),
    (12, 31, 'Worth the hype.', 5, '2024-05-19'),
    (11, 33, 'Runs smoothly on my system.', 4, '2024-05-20'),
    (20, 34, 'Not as good as previous installments.', 3, '2024-05-21'),
    (19, 35, 'An instant classic.', 5, '2024-05-22'),
    (18, 37, 'The soundtrack is phenomenal.', 4, '2024-05-23'),
    (17, 45, 'Could use more variety in missions.', 3, '2024-05-24'),
    (16, 50, 'Best game of the year!', 5, '2024-05-25'),
    (15, 39, 'The ending left me wanting more.', 4, '2024-05-26'),
    (14, 42, 'Not worth the price tag.', 2, '2024-05-27'),
    (13, 54, 'Absolutely amazing!', 5, '2024-05-28'),
    (12, 19, 'A bit repetitive, but enjoyable.', 3, '2024-05-29'),
    (11, 13, 'Disappointed with the graphics.', 2, '2024-05-30');
    
    INSERT INTO Transactions (userID, gameID, TransactionDate, Amount)
VALUES 
( 6, 11, '2024-05-10', 29.99),
( 7, 12, '2024-05-09', 19.99),
( 8, 13, '2024-05-08', 39.99),
( 9, 14, '2024-05-07', 49.99),
( 10, 15, '2024-05-06', 14.99),
( 11, 16, '2024-05-05', 24.99),
( 12, 17, '2024-05-04', 34.99),
( 13, 18, '2024-05-03', 44.99),
( 14, 19, '2024-05-02', 54.99),
( 15, 20, '2024-05-01', 19.99);

INSERT INTO GameplayData (UserID, GameID, Session_start_time, Session_end_time, Duration, Score)
VALUES 
( 1, 11, '2024-05-10 08:00:00', '2024-05-10 08:30:00', '00:30:00', 1500),
( 2, 12, '2024-05-09 14:00:00', '2024-05-09 15:00:00', '01:00:00', 2000),
( 3, 13, '2024-05-08 20:00:00', '2024-05-08 21:30:00', '01:30:00', 1800),
( 4, 14, '2024-05-07 10:00:00', '2024-05-07 11:00:00', '01:00:00', 2100),
( 5, 15, '2024-05-06 12:00:00', '2024-05-06 12:45:00', '00:45:00', 1600),
( 6, 16, '2024-05-05 16:00:00', '2024-05-05 16:30:00', '00:30:00', 1700),
( 7, 17, '2024-05-04 18:00:00', '2024-05-04 19:00:00', '01:00:00', 1900),
( 8, 18, '2024-05-03 09:00:00', '2024-05-03 10:15:00', '01:15:00', 2200),
( 9, 19, '2024-05-02 11:00:00', '2024-05-02 12:00:00', '01:00:00', 2400),
( 10, 20, '2024-05-01 13:00:00', '2024-05-01 13:45:00', '00:45:00', 1950);

INSERT INTO Wishlist (userID, gameID, Date_Added)
VALUES 
(4, 14, '2024-05-01'),
(6, 14, '2024-05-03'),
(8, 16, '2024-05-05'),
(10, 18, '2024-05-07'),
(12, 18, '2024-05-09'),
(23, 20, '2024-05-02'),
(12, 19, '2024-05-04'),
(12, 18, '2024-05-06'),
(22, 17, '2024-05-08'),
(28, 16, '2024-05-10'),
(31, 14, '2024-05-03'),
(32, 14, '2024-05-05'),
(33, 16, '2024-05-07'),
(34, 18, '2024-05-09'),
(39, 17, '2024-05-01'),
(45, 19, '2024-05-04'),
(49, 14, '2024-05-06'),
(44, 15, '2024-05-08'),
(43, 16, '2024-05-10'),
(42, 19, '2024-05-02');

INSERT INTO Tags (Tag_Name)
VALUES 
('Action'),
( 'Adventure'),
( 'Strategy'),
( 'RPG'),
('Simulation');


INSERT INTO Game_Tags ( GameID, TagID)
VALUES 
( 11, 1),
( 12, 2),
( 13, 5),
( 14, 4),
( 15, 3),
( 16, 5),
( 17, 1),
( 18, 3),
( 19, 4),
( 20, 2);

INSERT INTO user_status (USERID, subscription_status, account_open)
VALUES 
(1, 'Active', '2023-01-01'),
(2, 'Active', '2023-02-15'),
(3, 'Inactive', '2023-12-10'),
(4, 'Active', '2023-03-20'),
(5, 'Inactive', '2023-04-05'),
(6, 'Active', '2023-02-28'),
(7, 'Active', '2023-01-10'),
(8, 'Inactive', '2023-03-05'),
(9, 'Active', '2023-02-01'),
(10, 'Active', '2023-04-15'),
(11, 'Inactive', '2023-01-20'),
(12, 'Active', '2023-03-10'),
(13, 'Inactive', '2023-04-01'),
(14, 'Active', '2023-02-20'),
(15, 'Active', '2023-01-05'),
(16, 'Inactive', '2023-12-15'),
(17, 'Active', '2023-03-25'),
(18, 'Active', '2023-04-10'),
(19, 'Inactive', '2023-02-10'),
(20, 'Active', '2023-01-15'),
(21, 'Active', '2023-02-05'),
(22, 'Inactive', '2023-03-01'),
(23, 'Active', '2023-04-20'),
(24, 'Active', '2023-01-25'),
(25, 'Inactive', '2023-12-20'),
(26, 'Active', '2023-03-15'),
(27, 'Active', '2023-04-05'),
(28, 'Inactive', '2023-01-30'),
(29, 'Active', '2023-02-10'),
(30, 'Active', '2023-04-15'),
(31, 'Inactive', '2023-02-20'),
(32, 'Active', '2023-03-05'),
(33, 'Inactive', '2023-04-01'),
(34, 'Active', '2023-02-15'),
(35, 'Active', '2023-01-01'),
(36, 'Inactive', '2023-12-10'),
(37, 'Active', '2023-03-20'),
(38, 'Inactive', '2023-04-05'),
(39, 'Active', '2023-02-28'),
(40, 'Active', '2023-01-10'),
(41, 'Inactive', '2023-03-05'),
(42, 'Active', '2023-02-01'),
(43, 'Active', '2023-04-15'),
(44, 'Inactive', '2024-01-20'),
(45, 'Active', '2023-03-10'),
(46, 'Inactive', '2023-04-01'),
(47, 'Active', '2023-02-20'),
(48, 'Active', '2023-01-05'),
(49, 'Inactive', '2023-12-15'),
(50, 'Active', '2023-03-25'),
(51, 'Active', '2023-02-20'),
(52, 'Active', '2023-01-05'),
(53, 'Inactive', '2023-12-15'),
(54, 'Active', '2023-03-25');

INSERT INTO Comments (UserID, GameID, Comment_text, Comment_date)
VALUES
    (15, 11, 'This game is amazing!', '2024-05-10'),
    (28, 11, 'I love playing this game!', '2024-05-09'),
    (53, 13, 'The graphics are stunning.', '2024-05-08'),
    (18, 15, 'Highly recommend this game!', '2024-05-07'),
    (25, 18, 'The storyline is so engaging.', '2024-05-06'),
    (39, 20, 'Can''t stop playing this game!', '2024-05-05'),
    (15, 12, 'Best game ever!', '2024-05-04'),
    (25, 19, 'I wish there were more levels.', '2024-05-03'),
    (33, 17, 'Great gameplay mechanics.', '2024-05-02'),
    (15, 13, 'Awesome soundtrack!', '2024-05-01');








    
    
  
    