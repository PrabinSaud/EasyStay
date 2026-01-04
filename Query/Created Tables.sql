CREATE TABLE Students (
  StudentID INT AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50),
  PhoneNumber VARCHAR(15) UNIQUE NOT NULL,
  City VARCHAR(50),
  Email VARCHAR(100),
  College VARCHAR(100)
);

INSERT INTO Students (FirstName, LastName, PhoneNumber, City, Email, College) VALUES
('Rahul','Sharma','9876543201','Bangalore','rahul.sharma@gmail.com','Christ University'),
('Amit','Verma','9876543202','Bangalore','amit.verma@gmail.com','Jain University'),
('Priya','Singh','9876543203','Bangalore','priya.singh@gmail.com','PES University'),
('Neha','Patel','9876543204','Bangalore','neha.patel@gmail.com','BMS College of Engineering'),
('Rohit','Kumar','9876543205','Bangalore','rohit.kumar@gmail.com','RV College of Engineering'),
('Anjali','Mehta','9876543206','Bangalore','anjali.mehta@gmail.com','Dayananda Sagar College'),
('Suresh','Reddy','9876543207','Bangalore','suresh.reddy@gmail.com','Acharya Institute of Technology'),
('Kiran','Naik','9876543208','Bangalore','kiran.naik@gmail.com','Presidency University'),
('Pooja','Iyer','9876543209','Bangalore','pooja.iyer@gmail.com','MS Ramaiah Institute of Technology'),
('Arjun','Malhotra','9876543210','Bangalore','arjun.m@gmail.com','New Horizon College'),
('Vikas','Gupta','9876543211','Bangalore','vikas.g@gmail.com','East Point College of Engineering'),
('Sneha','Joshi','9876543212','Bangalore','sneha.j@gmail.com','CMR University'),
('Manoj','Das','9876543213','Bangalore','manoj.d@gmail.com','Global Academy of Technology'),
('Kavya','Nair','9876543214','Bangalore','kavya.n@gmail.com','Nitte Meenakshi Institute'),
('Deepak','Choudhary','9876543215','Bangalore','deepak.c@gmail.com','SJB Institute of Technology'),
('Ritu','Agarwal','9876543216','Bangalore','ritu.a@gmail.com','Garden City University'),
('Nikhil','Bansal','9876543217','Bangalore','nikhil.b@gmail.com','Bangalore Institute of Technology'),
('Swati','Kulkarni','9876543218','Bangalore','swati.k@gmail.com','Oxford College of Engineering'),
('Abhishek','Yadav','9876543219','Bangalore','abhishek.y@gmail.com','City Engineering College'),
('Meena','Rao','9876543220','Bangalore','meena.r@gmail.com','ABC College of Technology');

CREATE TABLE Rooms (
  RoomID INT AUTO_INCREMENT PRIMARY KEY,
  RoomType VARCHAR(50),
  Location VARCHAR(100),
  Rent DECIMAL(10,2),
  Availability ENUM('YES','NO') DEFAULT 'YES',
  Contact VARCHAR(15),
  StudentID INT,
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Rooms (RoomType, Location, Rent, Availability, Contact, StudentID) VALUES
('Single Room','BTM Layout',6000,'YES','9876543201',1),
('Double Room','Marathahalli',8500,'YES','9876543202',2),
('PG','Whitefield',5500,'NO','9876543203',3),
('Single Room','Yelahanka',5000,'YES','9876543204',4),
('Studio','Electronic City',9000,'YES','9876543205',5),
('Double Room','HSR Layout',8000,'NO','9876543206',6),
('Single Room','Banashankari',6200,'YES','9876543207',7),
('PG','KR Puram',4800,'YES','9876543208',8),
('Studio','Indiranagar',12000,'NO','9876543209',9),
('Single Room','Jayanagar',6500,'YES','9876543210',10),
('Double Room','Malleshwaram',7800,'YES','9876543211',11),
('PG','Yeshwanthpur',5000,'NO','9876543212',12),
('Single Room','Hebbal',5900,'YES','9876543213',13),
('Studio','Bellandur',11000,'YES','9876543214',14),
('Double Room','Rajajinagar',8200,'NO','9876543215',15),
('PG','Kengeri',4500,'YES','9876543216',16),
('Single Room','RT Nagar',6100,'YES','9876543217',17),
('Studio','Sarjapur',10000,'NO','9876543218',18),
('Double Room','Domlur',8300,'YES','9876543219',19),
('PG','Majestic',4200,'YES','9876543220',20);

CREATE TABLE Furnitures (
  ItemID INT AUTO_INCREMENT PRIMARY KEY,
  ItemName VARCHAR(100),
  Category VARCHAR(50),
  ItemCondition ENUM('NEW','GOOD','USED'),
  SellerID INT,
  FOREIGN KEY (SellerID) REFERENCES Students(StudentID)
);

INSERT INTO Furnitures (ItemName, Category, ItemCondition, SellerID) VALUES
('Study Table','Furniture','GOOD',1),
('Office Chair','Furniture','USED',2),
('Single Bed','Furniture','GOOD',3),
('Wardrobe','Furniture','USED',4),
('Dining Table','Furniture','GOOD',5),
('Bookshelf','Furniture','NEW',6),
('Mattress','Furniture','USED',7),
('Sofa','Furniture','GOOD',8),
('Plastic Chair','Furniture','USED',9),
('Computer Table','Furniture','GOOD',10),
('Cupboard','Furniture','USED',11),
('Wooden Bed','Furniture','GOOD',12),
('Side Table','Furniture','NEW',13),
('Office Desk','Furniture','GOOD',14),
('TV Stand','Furniture','USED',15),
('Study Chair','Furniture','GOOD',16),
('Dining Chair','Furniture','USED',17),
('Foldable Table','Furniture','NEW',18),
('Recliner','Furniture','GOOD',19),
('Shoe Rack','Furniture','USED',20);

CREATE TABLE FreeItems (
  FreeItemID INT AUTO_INCREMENT PRIMARY KEY,
  ItemName VARCHAR(100),
  Category VARCHAR(50),
  GiverID INT,
  FOREIGN KEY (GiverID) REFERENCES Students(StudentID)
);

INSERT INTO FreeItems (ItemName, Category, GiverID) VALUES
('Old Books','Books',1),
('Water Bottles','Kitchen',2),
('Curtains','Home',3),
('Plastic Plates','Kitchen',4),
('Shoes','Clothing',5),
('Backpack','Bags',6),
('Laptop Bag','Bags',7),
('Study Lamp','Electronics',8),
('Mats','Home',9),
('Notebook Bundle','Books',10),
('Cooking Pan','Kitchen',11),
('Bedsheet','Home',12),
('Whiteboard','Study',13),
('Extension Box','Electronics',14),
('Coffee Mug','Kitchen',15),
('Helmet','Accessories',16),
('Blanket','Home',17),
('Pen Stand','Study',18),
('Mouse','Electronics',19),
('Power Strip','Electronics',20);


CREATE TABLE RoomSharing (
  ShareID INT AUTO_INCREMENT PRIMARY KEY,
  Budget DECIMAL(10,2),
  Gender ENUM('MALE','FEMALE','ANY'),
  NumberOfStudents INT,
  RoomID INT,
  FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);


INSERT INTO RoomSharing (Budget, Gender, NumberOfStudents, RoomID) VALUES
(3000,'ANY',2,1),
(3500,'MALE',3,2),
(2500,'FEMALE',2,3),
(4000,'ANY',4,4),
(3200,'MALE',2,5),
(2800,'FEMALE',3,6),
(3600,'ANY',2,7),
(2900,'MALE',4,8),
(4100,'ANY',3,9),
(3300,'FEMALE',2,10),
(3700,'ANY',4,11),
(2600,'MALE',3,12),
(3400,'FEMALE',2,13),
(3900,'ANY',4,14),
(3100,'MALE',2,15),
(2700,'FEMALE',3,16),
(3800,'ANY',4,17),
(4200,'ANY',2,18),
(3600,'MALE',3,19),
(3000,'FEMALE',2,20);

SELECT * FROM students;
SELECT * FROM rooms;
SELECT * FROM furnitures;
SELECT * FROM freeitems;
SELECT * FROM roomsharing;

