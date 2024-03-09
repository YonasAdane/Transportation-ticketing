CREATE DATABASE TransportTicketingSys;
USE TransportTicketingSys;

-- User table: Stores information about users who interact with the system
CREATE TABLE User (
    UserID INT NOT NULL AUTO_INCREMENT,
    UserName VARCHAR(50),
    UserEmail VARCHAR(30),
    UserPhone VARCHAR(50),
    UserPassword VARCHAR(20),
    PRIMARY KEY (UserID)
);
CREATE TABLE Admin (
    AdminID INT NOT NULL AUTO_INCREMENT,
    AdminName VARCHAR(50),
    AdminEmail VARCHAR(30),
    AdminPhone VARCHAR(50),
    AdminPassword VARCHAR(20),
    PRIMARY KEY (AdminID)
);
Insert into Admin(AdminName, AdminEmail,AdminPhone, AdminPassword)
VALUES('BARTOZ','bartoz@gmail.com','0912233445',0000);

-- Driver table: Stores information about bus drivers
CREATE TABLE Driver (
    DriverID INT NOT NULL AUTO_INCREMENT,
    DriverName VARCHAR(50),
    DriverEmail VARCHAR(50),
    DriverPhone VARCHAR(20),
    DriverAddress VARCHAR(20),
    DriverPassword VARCHAR(50),
    PRIMARY KEY (DriverID)
);

-- Bus table: Records details about buses available in the system
CREATE TABLE Bus (
    BusID INT NOT NULL AUTO_INCREMENT,
    BusLevel VARCHAR(10),
    BusType VARCHAR(20),
    LicensePlate VARCHAR(10),
    CurrentCity VARCHAR(50),
    TotalSeats INT,
    AvailableSeat INT,
    DriverID INT UNIQUE,
    PRIMARY KEY (BusID),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID)
);
-- Alter TABLE Driver ADD COLUMN
--     BusID FOREIGN KEY  Bus(BusID);

-- Ticket table: Represents individual tickets booked by users
USE TransportTicketingSys;
CREATE TABLE Ticket (
    TicketID INT AUTO_INCREMENT,
    DepartureCity VARCHAR(50),
    DestinationCity VARCHAR(50),
    DepartureDateTime DATETIME NOT NULL,
    -- ArrivalDateTime DATETIME  NOT NULL,
    Price REAL,
    SeatNumber INT NOT NULL,
    UserID INT,
    DriverID INT,
    PRIMARY KEY (TicketID),
    INDEX (SeatNumber),
    -- INDEX (Price),
    BusID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
    FOREIGN KEY (BusID) REFERENCES Bus(BusID)
);

INSERT INTO User (UserName, UserEmail, UserPhone, UserPassword)
VALUES
    ('Yohannes Gezachew', 'yohannes@example.com', '1234567890', 'password1'),
    ('Fatima Ali', 'fatima@example.com', '9876543210', 'password2'),
    ('Ephrem Negash', 'ephrem@example.com', '5555555555', 'password3'),
    ('Aida Wondimu', 'aida@example.com', '1111111111', 'password4'),
    ('Abdullah Mohammed', 'abdullah@example.com', '9999999999', 'password5'),
    ('Sara Abate', 'sara@example.com', '8888888888', 'password6'),
    ('Yordanos Tadesse', 'yordanos@example.com', '7777777777', 'password7'),
    ('Hassan Omar', 'hassan@example.com', '6666666666', 'password8'),
    ('Daniel Girma', 'daniel@example.com',  '5555555555', 'password9'),
    ('Selamawit Hailu', 'selamawit@example.com', '4444444444', 'password10'),
    ('Ibrahim Ahmed', 'ibrahim@example.com','3333333333', 'password11'),
    ('Betelhem Alemu', 'betelhem@example.com','2222222222', 'password12'),
    ('Tsehay Solomon', 'tsehay@example.com', '1111111111', 'password13'),
    ('Mohammed Ali', 'mohammed@example.com', '9999999999', 'password14'),
    ('Amina Hassan', 'amina@example.com','8888888888', 'password15'),
    ('Hassan Ahmed', 'hassan@example.com', '7777777777', 'password16'),
    ('Yasin Ali', 'yasin@example.com', '6666666666', 'password17'),
    ('Firdaws Omar', 'firdaws@example.com', '5555555555', 'password18'),
    ('Layla Mohammed', 'layla@example.com', '4444444444', 'password19'),
    ('Ahmed Abdi', 'ahmed@example.com','3333333333', 'password20');
    

-- Insert data into the Driver table
INSERT INTO Driver (DriverName, DriverEmail, DriverPhone, DriverAddress, DriverPassword)
VALUES
    ('Muhammed Samson', 'muhammed@example.com', '1234567890', 'Bole', 'password1'),
    ('Fahmi Dinsefa', 'fahmi@example.com', '9876543210', 'Adama', 'password2'),
    ('Nebiyu Musbah', 'nebiyu@example.com', '5555555555', 'Addis Ababa', 'password3'),
    ('Abel Gezu', 'abel@example.com', '1111111111', 'China', 'password1'),
    ('Asegid Adane', 'asegid@example.com', '9999999999', 'Dubai', 'password2'),
    ('Yohannes Gezachew', 'yohannes@example.com', '5555555555', 'Addis Ababa', 'password3');
-- Select * from Driver;
-- Insert data into the Ticket table
INSERT INTO Ticket (DepartureCity, DestinationCity, DepartureDateTime, Price, UserID, DriverID)
VALUES
    ('Addis Ababa', 'Dire Dawa', '2024-02-01 08:00:00', 150.00, 10, 1),
    ('Bishoftu', 'Adama', '2024-02-02 09:30:00', 180.00, 15, 2),
    ('Mekelle', 'Jimma', '2024-02-03 11:15:00',  200.00, 20, 3),
    ('Bahir Dar', 'Arba Minch', '2024-02-04 10:45:00', 170.00, 12, 4),
    ('Bishoftu', 'Dessie', '2024-02-05 12:30:00', 190.00, 18, 5),
    ('Adama', 'Sodo', '2024-02-06 14:20:00', 160.00, 8, 6);
    
INSERT INTO Bus (BusLevel, BusType, LicensePlate, CurrentCity, DriverID)
VALUES
    ('Level 1', 'Minibus', 'ABC123', 'Addis Ababa', 1),
    ('Level 2', 'Autobus', 'XYZ456', 'Addis Ababa', 2),
    ('Level 1', 'Selambus', 'DEF789', 'Addis Ababa', 3),
    ('Level 2', 'Dolphine', 'GHI101', 'Addis Ababa', 4),
    ('Level 1', 'Minibus', 'JKL202', 'Addis Ababa', 5),
    ('Level 2', 'Autobus', 'MNO303', 'Addis Ababa', 6);

    -- ------------------------------------------------------ View  --------------------------------------------------------------------------------------------

-- CREATING A USER_INFO VIEW IN ORDER TO VIEW TICKETING INFORMATION ABOUT THE USER 
CREATE VIEW User_Info AS
SELECT
U.UserName,
U.UserPhone,
U.UserEmail,
B.BusLevel,
B.BusType,
B.LicensePlate,
T.SeatNumber,
D.DriverName
From
Ticket T
JOIN User U ON T.UserID = U.UserID
JOIN Driver D On T.DriverID = D.DriverID
JOIN Bus B on B.DriverID = D.DriverID;

select * from User_info;

 
-- CREATING A Driver_Info view in order to show the driver info with its corresponding bus  
CREATE VIEW Driver_Info AS
select 
D.DriverName,
D.DriverEmail,
D.DriverAddress,
D.DriverPhone,
B.LicensePlate,
B.BusType,
B.Buslevel
 From 
 Bus B
 JOIN Driver D ON B.DriverID = D.DriverID;

select * from Driver_Info;
