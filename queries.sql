DROP DATABASE IF EXISTS CS127;
CREATE DATABASE CS127;
USE CS127;

-- SUPPLIES AND INVENTORY --

CREATE TABLE IF NOT EXISTS Supplier (
    Supplier_Id INT PRIMARY KEY,
    Supplier_Name VARCHAR(255),
    Supplier_Address VARCHAR(255),
    Supplier_ContactNumber VARCHAR(15),
    Supplier_ContactEmail VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Item (
    Property_Id INT PRIMARY KEY,
    Employee_Id INT,
    Item_Type VARCHAR(50),
    Item_Status VARCHAR(20),
    Item_LastUpdated DATETIME,
    Supplier_Id INT,
    Item_Location VARCHAR(100),
    FOREIGN KEY (Supplier_Id) REFERENCES Supplier(Supplier_Id)
);

CREATE TABLE IF NOT EXISTS Transaction_History (
    Transaction_Id INT PRIMARY KEY,
    Property_Id INT,
    Transaction_Type VARCHAR(50),
    Transaction_Datetime DATETIME,
    FOREIGN KEY (Property_Id) REFERENCES Item(Property_Id)
);

INSERT INTO Supplier (Supplier_Id, Supplier_Name, Supplier_Address, Supplier_ContactNumber, Supplier_ContactEmail)
VALUES
    (1, 'ABC Suppliers', '123 Main Street', '555-1234', 'abc@example.com'),
    (2, 'XYZ Distributors', '456 Oak Avenue', '555-5678', 'xyz@example.com'),
    (3, 'LMN Electronics', '789 Pine Road', '555-9876', 'lmn@example.com'),
    (4, 'PQR Furniture', '101 Maple Lane', '555-4321', 'pqr@example.com'),
    (5, 'UVW Appliances', '202 Cedar Boulevard', '555-8765', 'uvw@example.com'),
    (6, 'EFG Office Solutions', '303 Birch Street', '555-2109', 'efg@example.com'),
    (7, 'GHI Supplies', '404 Elm Lane', '555-6543', 'ghi@example.com'),
    (8, 'JKL Electronics', '505 Oak Road', '555-3210', 'jkl@example.com'),
    (9, 'RST Furniture', '606 Pine Boulevard', '555-7654', 'rst@example.com'),
    (10, 'MNO Appliances', '707 Cedar Lane', '555-1098', 'mno@example.com');

INSERT INTO Item (Property_Id, Employee_Id, Item_Type, Item_Status, Item_LastUpdated, Supplier_Id, Item_Location)
VALUES
    (101, 1001, 'Laptop', 'Available', '2023-01-01 12:00:00', 1, 'Inventory'),
    (102, 1002, 'Chair', 'CurrentlyLoaned', '2023-01-02 10:30:00', 2, 'Office B'),
    (103, 1003, 'Printer', 'Available', '2023-01-03 14:15:00', 3, 'Inventory'),
    (104, 1004, 'Desk', 'CurrentlyLoaned', '2023-01-04 08:45:00', 4, 'Office D'),
    (105, 1005, 'Projector', 'Available', '2023-01-05 16:20:00', 5, 'Inventory'),
    (106, 1006, 'Sofa', 'CurrentlyLoaned', '2023-01-06 11:10:00', 6, 'Office F'),
    (107, 1007, 'Refrigerator', 'Available', '2023-01-07 13:30:00', 7, 'Inventory'),
    (108, 1008, 'Bookshelf', 'CurrentlyLoaned', '2023-01-08 09:55:00', 8, 'Office H'),
    (109, 1009, 'Microwave', 'Available', '2023-01-09 15:40:00', 9, 'Inventory'),
    (110, 1010, 'Whiteboard', 'CurrentlyLoaned', '2023-01-10 07:25:00', 10, 'Office J');

INSERT INTO Transaction_History (Transaction_Id, Property_Id, Transaction_Type, Transaction_Datetime)
VALUES
    (201, 101, 'Loan', '2023-02-01 09:00:00'),
    (202, 102, 'Upgrade', '2023-02-02 14:45:00'),
    (203, 103, 'Repair', '2023-02-03 11:30:00'),
    (204, 104, 'ReturnAfterRepair', '2023-02-04 08:15:00'),
    (205, 105, 'ReturnForUpgrade', '2023-02-05 16:50:00'),
    (206, 106, 'Loan', '2023-02-06 10:40:00'),
    (207, 107, 'Upgrade', '2023-02-07 13:20:00'),
    (208, 108, 'Repair', '2023-02-08 09:55:00'),
    (209, 109, 'ReturnAfterUpgrade', '2023-02-09 15:30:00'),
    (210, 110, 'ReturnForRepair', '2023-02-10 07:05:00');


CREATE TABLE IF NOT EXISTS Employee (
    Employee_ID INT NOT NULL UNIQUE,
    Employee_Name VARCHAR(50) NOT NULL,
    Employee_Position VARCHAR(50) NOT NULL,
    Employee_Salary INT NOT NULL,
    Employee_Email VARCHAR(50) NOT NULL,
    Employee_Password VARCHAR(50) NOT NULL,
    Employee_ReportsTo INT,
    PRIMARY KEY (Employee_ID),
    FOREIGN KEY (Employee_ReportsTo) REFERENCES Employee(Employee_ID)
);

INSERT INTO Employee VALUES
(1000, 'John Doe',       'CEO',                           80000, '1000@xyz.com', 'password', NULL),
(1100, 'Mark Ventura',   'Project Manager',               50000, '1100@xyz.com', 'password', 1000),
(1101, 'Juan Dela Cruz', 'Application Developer',         25000, '1101@xyz.com', 'password', 1100),
(1102, 'Pedro Penduko',  'Application Developer',         25000, '1102@xyz.com', 'password', 1100),
(1103, 'Maria Makiling', 'Application Developer',         25000, '1103@xyz.com', 'password', 1100),
(1200, 'Maria Clara',    'Administrative Officer',        20000, '1200@xyz.com', 'password', 1000),
(1201, 'Juan Tamad',     'Utility and Maintenance staff', 20000, '1201@xyz.com', 'password', 1200);

-- MARKETING AND CUSTOMER ACQUISITION --

CREATE TABLE IF NOT EXISTS Supplier (
    Client_ID INT(20) PRIMARY KEY,
    Client_CompanyName VARCHAR(30),
    Client_RepFirstName VARCHAR(30),
    Client_RepLastName VARCHAR(30),
    Client_RepContactNum VARCHAR(50),
    Client_SecRepFirstName VARCHAR(30),
    Client_SecRepLastName VARCHAR(30),
    Client_SecRepContactNum VARCHAR(50),
    Client_Address VARCHAR(30),
    Client_Email VARCHAR(30),
    Client_TelNo VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS Item (
    Contract_ID INT(20) PRIMARY KEY,
    Contract_LegalPerson VARCHAR(30),
    Contract_SignedDate DATE,
    Contract_StartDate DATE,
    Contract_EstimatedEndDate DATE,
    Contract_ActualEndDate DATE,
    Contract_ProjectDurationYears DECIMAL(3,2),
    Contract_MaintenanceYears INT(20),
    Contract_Status CHAR(20),
    Contract_FileLink VARCHAR(255),
    Project_ID INT(20),
    Signatory_ClientID INT(20),
    Signatory_EmployeeID INT(20),
    Transaction_ID INT(20),
    FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID),
    FOREIGN KEY (Signatory_ClientID) REFERENCES Client(Client_ID),
    FOREIGN KEY (Signatory_EmployeeID) REFERENCES Employee(Employee_ID),
    FOREIGN KEY (Transaction_ID) REFERENCES Contract_Transaction(CT_ID)

);



INSERT INTO Client (Client_ID, Client_CompanyName, Client_RepFirstName, Client_RepLastName, Client_RepContactNum, Client_SecRepFirstName, Client_SecRepLastName, Client_SecRepContactNum, Client_Address, Client_Email, Client_TelNo)
VALUES
(5892, 'Alpha Corporation', 'Eleanor', 'Scott', '+63 912 345-6789', 'Henry', 'Adams', '+63 923 456-7890', '123 Main St', 'alpha@alphacorp.com', '221-1234'),
(7310, 'Beta Enterprises', 'Sophie', 'Bennett', '+63 945 678-9012', 'William', 'Evans', '+63 909 876-5432', '456 Elm St', 'beta@betaenterprises.com', '221-9876'),
(2468, 'Gamma Ltd.', 'Grace', 'Carter', '+63 912 345-6789', 'Oliver', 'Gonzalez', '+63 923 456-7891', '789 Oak St', 'gamma@gammaltd.com', '221-7890'),
(9035, 'Delta Inc.', 'Natalie', 'Rodriguez', '+63 945 678-9012', 'Lucas', 'Gray', '+63 909 876-5433', '101 Pine St', 'delta@delta-inc.com', '221-4567'),
(1179, 'Epsilon Solutions', 'Victoria', 'Collins', '+63 912 345-6789', 'Alexander', 'Jenkins', '+63 923 456-7892', '202 Cedar St', 'epsilon@epsilon.com', '221-2345'),
(6542, 'Zeta Group', 'Samantha', 'Barnes', '+63 945 678-9012', 'Benjamin', 'Cooper', '+63 909 876-5434', '303 Walnut St', 'zeta@zeta.com', '221-8765'),
(8791, 'Eta Enterprises', 'David', 'Murphy', '+63 912 345-6789', 'Emma', 'Richardson', '+63 923 456-7893', '404 Maple St', 'eta@etaenterprises.com', '221-3214'),
(3320, 'Theta Solutions', 'Daniel', 'Gomez', '+63 945 678-9012', 'Eva', 'Simmons', '+63 909 876-5435', '505 Birch St', 'theta@theta-solutions.com', '221-6547'),
(4685, 'Iota Innovations', 'Matthew', 'Price', '+63 912 345-6789', 'Isabelle', 'Phillips', '+63 923 456-7894', '606 Oak St', 'iota@iota-innov.com', '221-9876'),
(1256, 'Kappa Technologies', 'Olivia', 'Taylor', '+63 945 678-9012', 'Noah', 'Parker', '+63 909 876-5436', '707 Elm St', 'kappa@kappa-tech.com', '221-8765'),
(7890, 'Monet Hotel', 'Maria', 'Santos', '+63 915 367-9219', 'Juan', 'Dela Cruz', '+63 998 765-4321', '789 Mahogany St', 'monet@mhotel.com', '221-8778');


INSERT INTO Contract (Contract_ID, Project_ID, Signatory_ClientID, Signatory_CompanyID, Transaction_ID, Contract_LegalPerson, Contract_SignedDate, Contract_StartDate, Contract_EstimatedEndDate, Contract_ActualEndDate, Contract_ProjectDurationYears, Contract_MaintenanceYears, Contract_Status, Contract_FileLink)
VALUES
(4000, 1, 5892, 20160076, 2000, 'Atty. Leni Hillario', '2018-09-18', '2018-10-31', '2020-10-31', '2020-11-31', 2.00, 3, 'finished', 'http://tinyurl.com/ID4000-Contract'),
(4001, 2, 7310, 20160076, 2001, 'Atty. Chel Diaz', '2018-09-01', '2018-11-28', '2019-11-28', '2019-12-28', 1.00, 4, 'finished', 'http://tinyurl.com/ID4001-Contract'),
(4002, 3, 2468, 20160076, 2002, 'Atty. Albee Reyes', '2018-09-04', '2018-10-31', '2019-10-31', '2019-11-31', 1.00, 5, 'finished', 'http://tinyurl.com/ID4002-Contract'),
(4003, 4, 9035, 20160076, 2003, 'Atty. Maki Bao', '2018-09-02', '2018-10-30', '2021-10-30', '2021-11-30', 3.00, 3, 'finished', 'http://tinyurl.com/ID4003-Contract'),
(4004, 5, 1179, 20160076, 2004, 'Atty. Carlos Alejandre', '2018-09-05', '2018-11-30', '2020-11-30', '2020-12-30', 2.00, 4, 'finished', 'http://tinyurl.com/ID4004-Contract'),
(4005, 6, 6542, 20160076, 2005, 'Atty. Belinda Ramos', '2019-03-21', '2019-04-21', '2021-04-21', null, 2.00, 5, 'ongoing', 'http://tinyurl.com/ID4005-Contract'),
(4006, 7, 8791, 20160076, 2006, 'Atty. Cecelia Lomeda', '2019-03-25', '2019-04-25', '2022-04-25', null, 3.00, 3, 'ongoing', 'http://tinyurl.com/ID4006-Contract'),
(4007, 8, 3320, 20160076, 2007, 'Atty. Denise Baruelo', '2019-04-23', '2019-05-23', '2023-05-23', null, 4.00, 4, 'ongoing', 'http://tinyurl.com/ID4007-Contract'),
(4008, 9, 4685, 20160076, 2008, 'Atty. Steve Reyes', '2019-04-13', '2019-05-13', '2022-05-13', null, 3.00, 5, 'ongoing', 'http://tinyurl.com/ID4008-Contract'),
(4009, 10, 1256, 20160076, 2009, 'Atty. Ricky Dawes', '2019-05-30', '2019-06-30', '2022-06-30', null, 3.00, 3, 'terminated', 'http://tinyurl.com/ID4009-Contract'),
(4010, 11, 7890, 20160076, 2010, 'Atty. Carlos Alejandre', '2020-01-30', '2020-02-25', '2023-02-25', null, 3.00, 4, 'ongoing', 'http://tinyurl.com/ID4010-Contract');



-- PROJECT MANAGEMENT --

CREATE TABLE IF NOT EXISTS Timeline (
    Timeline_ID INT NOT NULL UNIQUE AUTO_INCREMENT,
    Timeline_StartDate DATE NOT NULL,
    Timeline_ExpectedFinishDate DATE NOT NULL,
    Timeline_FinishDate DATE NOT NULL,
    Timeline_DaysLeft INT NOT NULL,
    PRIMARY KEY (Timeline_ID)
);

CREATE TABLE IF NOT EXISTS Team (
    Team_ID INT NOT NULL UNIQUE AUTO_INCREMENT,
    Team_Name VARCHAR(50) NOT NULL,
    Team_Leader_ID INT NOT NULL,
    PRIMARY KEY (Team_ID),
    FOREIGN KEY (Team_Leader_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE IF NOT EXISTS Project (
    Project_ID INT NOT NULL UNIQUE AUTO_INCREMENT,
    Project_Name VARCHAR(50) NOT NULL,
    Project_Description VARCHAR(50) NOT NULL,
    Project_Type VARCHAR(50) NOT NULL,
    Project_Budget INT NOT NULL,
    Project_Status VARCHAR(50) NOT NULL,
    Project_Timeline_ID INT NOT NULL,
    Project_Team_ID INT NOT NULL,
    Project_Contract_ID INT NOT NULL,
    PRIMARY KEY (Project_ID),
    FOREIGN KEY (Project_Timeline_ID) REFERENCES Timeline(Timeline_ID),
    FOREIGN KEY (Project_Team_ID) REFERENCES Team(Team_ID),
    FOREIGN KEY (Project_Contract_ID) REFERENCES Contract(Contract_ID)
);

CREATE TABLE IF NOT EXISTS Software (
    Software_Name VARCHAR(50) NOT NULL,
    Software_Version VARCHAR(50) NOT NULL,
    Software_Type VARCHAR(50) NOT NULL,
    Software_OS VARCHAR(50) NOT NULL,
    Software_Size INT NOT NULL,
    Software_Publisher VARCHAR(50) NOT NULL,
    Software_License VARCHAR(50) NOT NULL,
    PRIMARY KEY (Software_Name, Software_Version)
);

CREATE TABLE IF NOT EXISTS Team_Software (
    Team_ID INT NOT NULL,
    Software_Name VARCHAR(50) NOT NULL,
    Software_Version VARCHAR(50) NOT NULL,
    PRIMARY KEY (Team_ID, Software_Name, Software_Version),
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID),
    FOREIGN KEY (Software_Name, Software_Version) REFERENCES Software(Software_Name, Software_Version)
);

INSERT INTO Timeline (Timeline_StartDate, Timeline_ExpectedFinishDate, Timeline_FinishDate, Timeline_DaysLeft) VALUES
('2018-10-01', '2018-10-31', '2018-10-31', 0),
('2018-10-01', '2018-11-28', '2018-11-28', 0),
('2018-10-01', '2018-10-31', '2018-10-31', 0),
('2018-10-01', '2018-10-30', '2018-10-30', 0),
('2018-10-01', '2018-11-30', '2018-11-30', 0);

INSERT INTO Team (Team_Name, Team_Leader_ID) VALUES
('Team 1', 1100),
('Team 2', 1100),
('Team 3', 1100),
('Team 4', 1100),
('Team 5', 1100);

INSERT INTO Project (Project_Name, Project_Description, Project_Type, Project_Budget, Project_Status, Project_Timeline_ID, Project_Team_ID, Project_Contract_ID) VALUES
('Uno', 'Project 1 Description', 'Web Application', 100000, 'In Development', 1, 1, 1),
('Dos', 'Project 2 Description', 'Mobile Application', 200000, 'For Presentation', 2, 2, 2),
('Tenesis', 'Project 3 Description', 'Stand-alone Systems', 300000, 'For Deployment', 3, 3, 3),
('Quatro', 'Project 4 Description', 'Web Application', 400000, 'For Monitoring', 4, 4, 4),
('Senco', 'Project 5 Description', 'Mobile Application', 500000, 'Done', 5, 5, 5);

INSERT INTO Software (Software_Name, Software_Version, Software_Type, Software_OS, Software_Size, Software_Publisher, Software_License) VALUES
('Software 1', '1.0', 'Software 1 Type', 'Software 1 OS', 100, 'Software 1 Publisher', 'PDI'),
('Software 2', '2.0', 'Software 2 Type', 'Software 2 OS', 200, 'Software 2 Publisher', 'LGPL'),
('Software 3', '3.0', 'Software 3 Type', 'Software 3 OS', 300, 'Software 3 Publisher', 'Permissive'),
('Software 4', '4.0', 'Software 4 Type', 'Software 4 OS', 400, 'Software 4 Publisher', 'Copy Left'),
('Software 5', '5.0', 'Software 5 Type', 'Software 5 OS', 500, 'Software 5 Publisher', 'Proprietary');

INSERT INTO Team_Software (Team_ID, Software_Name, Software_Version) VALUES
(1, 'Software 1', '1.0'),
(2, 'Software 2', '2.0'),
(3, 'Software 3', '3.0'),
(4, 'Software 4', '4.0'),
(5, 'Software 5', '5.0');
