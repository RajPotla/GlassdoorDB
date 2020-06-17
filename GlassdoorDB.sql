CREATE TABLE Company(
	Company_ID INT PRIMARY KEY IDENTITY(1,1),
	Company_Name VARCHAR(60),
	HQ_City VARCHAR(30),
	Sector VARCHAR(20),
	Total_Employees INT,
	Annual_Revenue INT,
)


CREATE TABLE Job(
	Job_ID INT PRIMARY KEY IDENTITY(1,1),
	Title VARCHAR(30),
	Job_Description VARCHAR(400),
	Date_Posted DATETIME,
	Job_Status VARCHAR(10),
	Company_ID INT FOREIGN KEY REFERENCES Company(Company_ID)
)


CREATE TABLE User_P(
	User_ID INT PRIMARY KEY IDENTITY(1,1),
	First_Name VARCHAR(30),
	Last_Name VARCHAR(30),
	E_mail VARCHAR(30),
	Phone_Number INT,
	date_created DATETIME
);



CREATE TABLE Review(
	ID INT PRIMARY KEY IDENTITY(1,1),
	Title VARCHAR(20),
	Description VARCHAR(400),
	Date_Created DATETIME,
	User_ID INT FOREIGN KEY REFERENCES User_P(User_ID),
	Job_ID INT FOREIGN KEY REFERENCES Job(Job_ID)
)

