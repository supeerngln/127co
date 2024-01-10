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

CREATE TABLE IF NOT EXISTS Client (
    Client_ID INT NOT NULL UNIQUE AUTO_INCREMENT,
    Client_CompanyName VARCHAR(50) NOT NULL,
    Client_CompanyRep VARCHAR(50) NOT NULL,
    Client_Address VARCHAR(50) NOT NULL,
    Client_Contact VARCHAR(50) NOT NULL,
    Client_Email VARCHAR(50) NOT NULL,
    Client_Password VARCHAR(50) NOT NULL,
    PRIMARY KEY (Client_ID)
);

CREATE TABLE IF NOT EXISTS Contract (
    Contract_ID INT NOT NULL UNIQUE AUTO_INCREMENT,
    Contract_DevelopmentDuration INT NOT NULL,
    Contract_MaintenanceYears INT NOT NULL,
    Contract_FullyPaid BOOLEAN NOT NULL,
    Contract_Client_ID INT NOT NULL,
    PRIMARY KEY (Contract_ID),
    FOREIGN KEY (Contract_Client_ID) REFERENCES Client(Client_ID)
);

INSERT INTO Client (Client_CompanyName, Client_CompanyRep, Client_Address, Client_Contact, Client_Email, Client_Password) VALUES
('Google', 'Larry Page', '1600 Amphitheatre Parkway, Mountain View, CA 94043', '6502530000', 'larrypage@gmail.com', 'password'), 
('Apple', 'Tim Cook', '1 Infinite Loop, Cupertino, CA 95014', '4089961010', 'timcook@apple.com', 'password'),
('Microsoft', 'Satya Nadella', 'One Microsoft Way, Redmond, WA 98052', '4258828080', 'satyanadella@microsoft.com', 'password'),
('Facebook', 'Mark Zuckerberg', '1 Hacker Way, Menlo Park, CA 94025', '6505434800', 'markzuckerber@facebook.com', 'password'),
('Amazon', 'Jeff Bezos', '410 Terry Ave. North, Seattle, WA 98109-5210', '2062661000', 'jeffbezos@amazon.com', 'password');

INSERT INTO Contract (Contract_DevelopmentDuration, Contract_MaintenanceYears, Contract_FullyPaid, Contract_Client_ID) VALUES
(30, 5, 0, 1), 
(60, 10, 0, 2), 
(90, 15, 0, 3), 
(120, 20, 0, 4), 
(150, 25, 0, 5);

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

-- FINANCE --

CREATE TABLE IF NOT EXISTS Salary (
    salary_id INT PRIMARY KEY NOT NULL,
    employee_id INT,
    salary_date DATE,
    salary_net DECIMAL(10, 2),
    salary_gross DECIMAL(10, 2),
    salary_added DECIMAL(10, 2),
    salary_deducted DECIMAL(10, 2),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
CREATE TABLE IF NOT EXISTS Budget (
    budget_id INT PRIMARY KEY NOT NULL,
    budget_name VARCHAR(255), 
    budget_category VARCHAR(255),
    budget_amount DECIMAL(10, 2),
    property_id INT,
    FOREIGN KEY (property_id) REFERENCES Item(property_id)
);
CREATE TABLE IF NOT EXISTS Expenditure (
    expense_id INT PRIMARY KEY NOT NULL,
    expense_name VARCHAR(255), 
    expense_date DATE,
    expense_amount DECIMAL(10, 2),
    contract_id INT,
    expense_project_status varchar(255),
    salary_id INT,
    FOREIGN KEY (contract_id) REFERENCES contract(contract_id),
    FOREIGN KEY (salary_id) REFERENCES salary(salary_id)
);
CREATE TABLE IF NOT EXISTS Contract_Transaction (
    ct_id INT PRIMARY KEY NOT NULL,
    ct_date DATE,
    ct_total_amount DECIMAL(10, 2),
    ct_payment DECIMAL(10, 2),       
    ct_balance DECIMAL(10, 2),       
    ct_total_paid DECIMAL(10, 2) DEFAULT 0.00,      
    ct_payment_type VARCHAR(255),       
    contract_id INT,
    FOREIGN KEY (contract_id) REFERENCES Contract(contract_id)
);

INSERT INTO Salary VALUES
(20231101, 1000, '2023-11-08', 183427,  152234, 32435, 1232),
(20231102, 1100, '2023-11-08', 155575,  82445,  76543, 3413),
(20231103, 1101, '2023-11-08', 93408,   73434,  23431, 3457),
(20231104, 1102, '2023-11-08', 75049,   48123,  34579, 7653),
(20231105, 1103, '2023-11-08', 79203,   37235,  45632, 3664),
(20231106, 1200, '2023-11-08', 133236,  63346,  78653, 8763),
(20231107, 1201, '2023-11-08', 137430,  51237,  89765, 3572);

INSERT INTO Budget VALUES 
(1111, 'Laptop',    'Item',     100000, 101),
(1112, 'Dos',       'Project',  500000, NULL),
(1113, 'Printer',   'Item',     20000,  103),
(1114, 'Tablet',    'Item',     80000,  104),
(1115, 'Projector', 'Item',     50000,  105);


INSERT INTO Expenditure VALUES 
(33101, 'Employee Salary',  '2023-11-08', 183427,   NULL,   NULL,               20231101),
(33102, 'Employee Salary',  '2023-11-08', 155575,   NULL,   NULL,               20231102),
(33103, 'Project',          '2020-11-30', 130000,   1,      'Mid-Development',  NULL),
(33104, 'Employee Salary',  '2023-11-08', 75049,    NULL,   NULL,               20231104),
(33105, 'Project',          '2019-12-28', 12365,    2,      'Completed',        NULL);

INSERT INTO Contract_Transaction VALUES 
(20001, '2020-11-30', 300000, 50000,    0, 250000, 'Bank Transfer (CitiBank)', 1),
(20002, '2019-12-28', 500000, 150000,   0, 350000, 'Bank Transfer (BDO)', 2),
(20003, '2019-11-30', 870000, 90000,    0, 780000, 'Bank Transfer (BPI)', 3),
(20004, '2021-11-30', 620000, 100000,   0, 520000, 'Bank Transfer (MetroBank)', 4),
(20005, '2020-12-30', 390000, 90000,    0, 300000, 'Bank Transfer (CitiBank)', 5);