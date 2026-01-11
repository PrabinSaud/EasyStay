use easystay;

ALTER TABLE Students
MODIFY LastName VARCHAR(50) NULL,
MODIFY City VARCHAR(50) NULL,
MODIFY Email VARCHAR(100) NULL,
MODIFY College VARCHAR(100) NULL;

ALTER TABLE Students
MODIFY PhoneNumber VARCHAR(15) NULL;


INSERT INTO Students (FirstName, LastName, PhoneNumber, City, Email, College) VALUES
('Ravi',NULL,'9675000501','Bangalore',NULL,'Christ University'),
('Anita','Sharma','9324566541','Bangalore','anita@gmail.com','Jain University'),
('Suman',NULL,'9873349762',NULL,NULL,NULL),
('Kiran','Rao',NULL,'Mysore','kiran@gmail.com',''),
('Aakash','Verma','9924366123','Bangalore',NULL,'RV College'),
('Pooja','Nair','9008954874','Kochi','pooja@gmail.com',NULL),
('Manoj','',NULL,'Bangalore','manoj@gmail.com','PES'),
('Neha','Singh','9000887655',NULL,NULL,'BMS'),
('Rahul','Das','9000003456','Delhi','rahul@gmail.com',''),
('Sneha',NULL,'7602043327','Bangalore','sneha@gmail.com','Christ'),
('Amit','Patel',NULL,NULL,NULL,NULL),
('Divya','',NULL,'Chennai','divya@gmail.com','SRM'),
('Suresh','Kumar','9897543008','Bangalore',NULL,''),
('Meena',NULL,'9000000009',NULL,NULL,'Jain'),
('Nikhil','',NULL,'Bangalore','nikhil@gmail.com',NULL),
('Ritu','Shah','8945670010','Ahmedabad',NULL,''),
('Vikas',NULL,NULL,'Bangalore','vikas@gmail.com','RV'),
('Anjali','',NULL,NULL,NULL,NULL),
('Harsh','Mehta','7837800011','Mumbai',NULL,'NMIMS'),
('Kavya',NULL,'6780000012','Bangalore','kavya@gmail.com','Christ');

ALTER TABLE Rooms
MODIFY Contact VARCHAR(15) NULL,
MODIFY StudentID INT NULL,
MODIFY Availability ENUM('YES','NO','PENDING') DEFAULT 'YES',
ADD CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

INSERT INTO Rooms
(RoomType, Location, Rent, Availability, Contact, StudentID, CreatedAt)
VALUES
('Single','BTM',4500,'YES','9999999999',1,NOW() - INTERVAL 20 DAY),
('Single','BTM',4500,'NO','9999999999',1,NOW() - INTERVAL 19 DAY),
('Double','Whitefield',8000,'YES',NULL,2,NOW() - INTERVAL 18 DAY),
('PG','Whitefield',4800,'NO','8888888888',NULL,NOW() - INTERVAL 17 DAY),
('Studio','Indiranagar',12000,'YES','7777777777',3,NOW() - INTERVAL 16 DAY),
('Single','Yelahanka',5000,'YES',NULL,4,NOW() - INTERVAL 15 DAY),
('PG','KR Puram',4300,'NO','6666666666',NULL,NOW() - INTERVAL 14 DAY),
('Double','HSR',7500,'YES','5555555555',5,NOW() - INTERVAL 13 DAY),
('Studio','Bellandur',11000,'NO','4444444444',6,NOW() - INTERVAL 12 DAY),
('Single','Jayanagar',6200,'YES',NULL,7,NOW() - INTERVAL 11 DAY),
('PG','Majestic',4000,'YES','3333333333',NULL,NOW() - INTERVAL 10 DAY),
('Double','Rajajinagar',8200,'NO','2222222222',8,NOW() - INTERVAL 9 DAY),
('Single','Hebbal',5900,'YES',NULL,9,NOW() - INTERVAL 8 DAY),
('Studio','Sarjapur',10000,'NO','1111111111',10,NOW() - INTERVAL 7 DAY),
('PG','Kengeri',4200,'YES',NULL,NULL,NOW() - INTERVAL 6 DAY),
('Single','RT Nagar',6100,'YES','1212121212',11,NOW() - INTERVAL 5 DAY),
('Double','Domlur',8300,'NO',NULL,12,NOW() - INTERVAL 4 DAY),
('Studio','Marathahalli',9500,'YES','1313131313',13,NOW() - INTERVAL 3 DAY),
('PG','Yeshwanthpur',4700,'NO','1414141414',NULL,NOW() - INTERVAL 2 DAY),
('Single','Banashankari',5800,'YES',NULL,14,NOW() - INTERVAL 1 DAY);

ALTER TABLE Furnitures
MODIFY SellerID INT NOT NULL,
MODIFY Price DECIMAL(10,2) NOT NULL DEFAULT 0,
MODIFY Description VARCHAR(255) NOT NULL DEFAULT 'No description provided',
MODIFY CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;

INSERT INTO Furnitures
(ItemName, Category, ItemCondition, SellerID, Price, Description, CreatedAt)
VALUES
('Study Table','Furniture','USED',1,1200,'scratched surface',NOW()-INTERVAL 20 DAY),
('Study Table','Furniture','USED',1,1000,'minor damage',NOW()-INTERVAL 19 DAY),
('Office Chair','Furniture','GOOD',2,800,'office chair',NOW()-INTERVAL 18 DAY),
('Office Chair','Furniture','GOOD',2,850,'adjustable chair',NOW()-INTERVAL 17 DAY),
('Single Bed','Furniture','USED',3,2500,'single bed frame',NOW()-INTERVAL 16 DAY),
('Single Bed','Furniture','USED',3,2300,'bed without mattress',NOW()-INTERVAL 15 DAY),
('Sofa','Furniture','GOOD',4,4000,'3-seater sofa',NOW()-INTERVAL 14 DAY),
('Sofa','Furniture','GOOD',4,3800,'slightly faded',NOW()-INTERVAL 13 DAY),
('Dining Table','Furniture','NEW',5,6000,'new dining table',NOW()-INTERVAL 12 DAY),
('Dining Table','Furniture','NEW',5,6200,'sealed pack',NOW()-INTERVAL 11 DAY),
('Cupboard','Furniture','USED',6,3000,'wooden cupboard',NOW()-INTERVAL 10 DAY),
('Cupboard','Furniture','USED',6,2800,'minor scratches',NOW()-INTERVAL 9 DAY),
('Mattress','Furniture','GOOD',7,1500,'foam mattress',NOW()-INTERVAL 8 DAY),
('Mattress','Furniture','GOOD',7,1400,'single size',NOW()-INTERVAL 7 DAY),
('Bookshelf','Furniture','NEW',8,1800,'5-shelf unit',NOW()-INTERVAL 6 DAY),
('Bookshelf','Furniture','NEW',8,1900,'engineered wood',NOW()-INTERVAL 5 DAY),
('Computer Desk','Furniture','USED',9,1600,'computer desk',NOW()-INTERVAL 4 DAY),
('Computer Desk','Furniture','USED',9,1500,'compact size',NOW()-INTERVAL 3 DAY),
('Study Chair','Furniture','USED',10,600,'plastic chair',NOW()-INTERVAL 2 DAY),
('Study Chair','Furniture','USED',10,650,'comfortable chair',NOW()-INTERVAL 1 DAY);

UPDATE FreeItems SET ItemName = 'Engineering Books' WHERE ItemName = 'Old Books';
UPDATE FreeItems SET ItemName = 'Reusable Water Bottle' WHERE ItemName = 'Water Bottle';
UPDATE FreeItems SET ItemName = 'Window Curtains' WHERE ItemName = 'Curtains';
UPDATE FreeItems SET ItemName = 'Plastic Plate Set' WHERE ItemName = 'Plastic Plates';
UPDATE FreeItems SET ItemName = 'Casual Shoes' WHERE ItemName = 'Shoes';
UPDATE FreeItems SET ItemName = 'College Backpack' WHERE ItemName = 'Backpack';
UPDATE FreeItems SET ItemName = 'Laptop Carry Bag' WHERE ItemName = 'Laptop Bag';
UPDATE FreeItems SET ItemName = 'LED Study Lamp' WHERE ItemName = 'Study Lamp';
UPDATE FreeItems SET ItemName = 'Floor Mats Set' WHERE ItemName = 'Floor Mats';
UPDATE FreeItems SET ItemName = 'Notebook Pack' WHERE ItemName = 'Notebook Bundle';
UPDATE FreeItems SET ItemName = 'Non-stick Cooking Pan' WHERE ItemName = 'Cooking Pan';
UPDATE FreeItems SET ItemName = 'Cotton Bedsheet' WHERE ItemName = 'Bedsheet';
UPDATE FreeItems SET ItemName = 'Magnetic Whiteboard' WHERE ItemName = 'Whiteboard';
UPDATE FreeItems SET ItemName = 'Electrical Extension Box' WHERE ItemName = 'Extension Box';
UPDATE FreeItems SET ItemName = 'Ceramic Coffee Mug' WHERE ItemName = 'Coffee Mug';
UPDATE FreeItems SET ItemName = 'Two-Wheeler Helmet' WHERE ItemName = 'Helmet';
UPDATE FreeItems SET ItemName = 'Winter Blanket' WHERE ItemName = 'Blanket';
UPDATE FreeItems SET ItemName = 'Desk Pen Stand' WHERE ItemName = 'Pen Stand';
UPDATE FreeItems SET ItemName = 'USB Optical Mouse' WHERE ItemName = 'Mouse';
UPDATE FreeItems SET ItemName = 'Surge Protector Power Strip' WHERE ItemName = 'Power Strip';


-- Here we drop the table freeitems and create a new tables with new values 
CREATE TABLE FreeItems (
  FreeItemID INT AUTO_INCREMENT PRIMARY KEY,
  ItemName VARCHAR(100) NOT NULL,
  Category VARCHAR(50) NOT NULL,
  GiverID INT NOT NULL,
  ItemCondition ENUM('NEW','GOOD','USED') NOT NULL,
  Notes VARCHAR(255) NOT NULL,
  CreatedAt DATETIME NOT NULL,
  FOREIGN KEY (GiverID) REFERENCES Students(StudentID)
);
INSERT INTO FreeItems
(ItemName, Category, GiverID, ItemCondition, Notes, CreatedAt)
VALUES
('Old Books','Books',1,'USED','engineering books',NOW()-INTERVAL 40 DAY),
('Old Books','Books',1,'USED','previous semester books',NOW()-INTERVAL 39 DAY),
('Water Bottle','Kitchen',2,'GOOD','steel bottle',NOW()-INTERVAL 38 DAY),
('Water Bottle','Kitchen',2,'GOOD','plastic bottle',NOW()-INTERVAL 37 DAY),
('Curtains','Home',3,'USED','window curtains',NOW()-INTERVAL 36 DAY),
('Curtains','Home',3,'USED','slightly faded',NOW()-INTERVAL 35 DAY),
('Plastic Plates','Kitchen',4,'GOOD','set of plates',NOW()-INTERVAL 34 DAY),
('Plastic Plates','Kitchen',4,'GOOD','lightweight plates',NOW()-INTERVAL 33 DAY),
('Shoes','Clothing',5,'USED','size 8 shoes',NOW()-INTERVAL 32 DAY),
('Shoes','Clothing',5,'USED','sports shoes',NOW()-INTERVAL 31 DAY),
('Backpack','Bags',6,'GOOD','college backpack',NOW()-INTERVAL 30 DAY),
('Backpack','Bags',6,'GOOD','travel bag',NOW()-INTERVAL 29 DAY),
('Laptop Bag','Bags',7,'GOOD','padded laptop bag',NOW()-INTERVAL 28 DAY),
('Laptop Bag','Bags',7,'GOOD','office style bag',NOW()-INTERVAL 27 DAY),
('Study Lamp','Electronics',8,'GOOD','desk lamp',NOW()-INTERVAL 26 DAY),
('Study Lamp','Electronics',8,'GOOD','LED lamp',NOW()-INTERVAL 25 DAY),
('Floor Mats','Home',9,'USED','room mats',NOW()-INTERVAL 24 DAY),
('Floor Mats','Home',9,'USED','cotton mats',NOW()-INTERVAL 23 DAY),
('Notebook Bundle','Books',10,'NEW','unused notebooks',NOW()-INTERVAL 22 DAY),
('Notebook Bundle','Books',10,'NEW','ruled notebooks',NOW()-INTERVAL 21 DAY),
('Cooking Pan','Kitchen',11,'GOOD','non-stick pan',NOW()-INTERVAL 20 DAY),
('Cooking Pan','Kitchen',11,'GOOD','small frying pan',NOW()-INTERVAL 19 DAY),
('Bedsheet','Home',12,'USED','single bed sheet',NOW()-INTERVAL 18 DAY),
('Bedsheet','Home',12,'USED','cotton bedsheet',NOW()-INTERVAL 17 DAY),
('Whiteboard','Study',13,'GOOD','small whiteboard',NOW()-INTERVAL 16 DAY),
('Whiteboard','Study',13,'GOOD','marker included',NOW()-INTERVAL 15 DAY),
('Extension Box','Electronics',14,'GOOD','4-socket extension',NOW()-INTERVAL 14 DAY),
('Extension Box','Electronics',14,'GOOD','long wire',NOW()-INTERVAL 13 DAY),
('Coffee Mug','Kitchen',15,'GOOD','ceramic mug',NOW()-INTERVAL 12 DAY),
('Coffee Mug','Kitchen',15,'GOOD','large size mug',NOW()-INTERVAL 11 DAY),
('Helmet','Accessories',16,'USED','bike helmet',NOW()-INTERVAL 10 DAY),
('Helmet','Accessories',16,'USED','ISI certified',NOW()-INTERVAL 9 DAY),
('Blanket','Home',17,'USED','winter blanket',NOW()-INTERVAL 8 DAY),
('Blanket','Home',17,'USED','double bed size',NOW()-INTERVAL 7 DAY),
('Pen Stand','Study',18,'GOOD','plastic pen stand',NOW()-INTERVAL 6 DAY),
('Pen Stand','Study',18,'GOOD','desk organizer',NOW()-INTERVAL 5 DAY),
('Mouse','Electronics',19,'USED','USB mouse',NOW()-INTERVAL 4 DAY),
('Mouse','Electronics',19,'USED','optical mouse',NOW()-INTERVAL 3 DAY),
('Power Strip','Electronics',20,'GOOD','surge protector',NOW()-INTERVAL 2 DAY),
('Power Strip','Electronics',20,'GOOD','6-socket strip',NOW()-INTERVAL 1 DAY);


ALTER TABLE RoomSharing
MODIFY Budget DECIMAL(10,2) NULL,
MODIFY Gender ENUM('MALE','FEMALE','ANY','OTHER') DEFAULT 'ANY',
MODIFY NumberOfStudents INT NULL,
ADD CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ;

INSERT INTO RoomSharing
(Budget, Gender, NumberOfStudents, RoomID, CreatedAt)
VALUES
(2500,'ANY',2,1,NOW()-INTERVAL 20 DAY),
(2500,'ANY',2,1,NOW()-INTERVAL 19 DAY),
(3000,'MALE',3,2,NOW()-INTERVAL 18 DAY),
(NULL,'FEMALE',2,3,NOW()-INTERVAL 17 DAY),
(4000,'ANY',4,4,NOW()-INTERVAL 16 DAY),
(3500,'MALE',NULL,5,NOW()-INTERVAL 15 DAY),
(2800,'FEMALE',3,6,NOW()-INTERVAL 14 DAY),
(3000,'ANY',2,7,NOW()-INTERVAL 13 DAY),
(NULL,'ANY',NULL,8,NOW()-INTERVAL 12 DAY),
(4200,'MALE',4,9,NOW()-INTERVAL 11 DAY),
(2600,'FEMALE',2,10,NOW()-INTERVAL 10 DAY),
(2700,'ANY',3,11,NOW()-INTERVAL 9 DAY),
(3800,'ANY',4,12,NOW()-INTERVAL 8 DAY),
(3100,'MALE',2,13,NOW()-INTERVAL 7 DAY),
(NULL,'FEMALE',3,14,NOW()-INTERVAL 6 DAY),
(2900,'ANY',2,15,NOW()-INTERVAL 5 DAY),
(3600,'MALE',4,16,NOW()-INTERVAL 4 DAY),
(3300,'FEMALE',2,17,NOW()-INTERVAL 3 DAY),
(4000,'ANY',3,18,NOW()-INTERVAL 2 DAY),
(3000,'ANY',2,19,NOW()-INTERVAL 1 DAY);


