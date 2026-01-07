/* =========================================================
				EASY STAY DASHBOARD QUESTIONS 
   ========================================================= */
use easystay;

/* Q1. How many rooms are available right now? */
SELECT COUNT(*) AS available_rooms
FROM Rooms
WHERE Availability = 'YES';


/* Q2. Availability vs occupied rooms (overall count) */
SELECT Availability, COUNT(*) AS total_rooms
FROM Rooms
GROUP BY Availability;


/* Q3. Which locations have the least room availability? */
SELECT Location,
       SUM(Availability = 'YES') AS available_rooms,
       SUM(Availability = 'NO') AS occupied_rooms
FROM Rooms
GROUP BY Location
ORDER BY available_rooms ASC;


/* Q4. What is the average rent by location? */
SELECT Location, ROUND(AVG(Rent), 2) AS average_rent
FROM Rooms
GROUP BY Location;


/* Q5. What are the minimum and maximum rents by room type? */
SELECT RoomType,
       MIN(Rent) AS minimum_rent,
       MAX(Rent) AS maximum_rent
FROM Rooms
GROUP BY RoomType;


/* Q6. Which rooms have sharing budgets lower than actual rent? */
SELECT r.RoomID,
       r.Location,
       r.Rent,
       rs.Budget * rs.NumberOfStudents AS total_sharing_budget
FROM Rooms r
JOIN RoomSharing rs ON r.RoomID = rs.RoomID
WHERE rs.Budget * rs.NumberOfStudents < r.Rent;


/* Q7. Which room type is listed the most? */
SELECT RoomType, COUNT(*) AS total_listings
FROM Rooms
GROUP BY RoomType
ORDER BY total_listings DESC;


/* Q8. What is the gender preference distribution for room sharing? */
SELECT Gender, COUNT(*) AS total_requests
FROM RoomSharing
GROUP BY Gender;


/* Q9. What is the most common number of students sharing a room? */
SELECT NumberOfStudents, COUNT(*) AS total_requests
FROM RoomSharing
GROUP BY NumberOfStudents
ORDER BY total_requests DESC;


/* Q10. How many students are active in each module? */
SELECT
  (SELECT COUNT(DISTINCT StudentID) FROM Rooms) AS room_owners,
  (SELECT COUNT(DISTINCT SellerID) FROM Furnitures) AS furniture_sellers,
  (SELECT COUNT(DISTINCT GiverID) FROM FreeItems) AS free_item_givers;


/* Q11. Which students are active in rooms, furniture, and free items? */
SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s
WHERE s.StudentID IN (SELECT StudentID FROM Rooms)
  AND s.StudentID IN (SELECT SellerID FROM Furnitures)
  AND s.StudentID IN (SELECT GiverID FROM FreeItems);


/* Q12. Which colleges contribute the most room listings? */
SELECT s.College, COUNT(r.RoomID) AS total_rooms
FROM Students s
JOIN Rooms r ON s.StudentID = r.StudentID
GROUP BY s.College
ORDER BY total_rooms DESC;


/* Q13. What is the average rent associated with each college? */
SELECT s.College, ROUND(AVG(r.Rent), 2) AS average_rent
FROM Students s
JOIN Rooms r ON s.StudentID = r.StudentID
GROUP BY s.College;


/* Q14. Which furniture categories are sold the most? */
SELECT Category, COUNT(*) AS total_items
FROM Furnitures
GROUP BY Category
ORDER BY total_items DESC;


/* Q15. Which free item categories are most commonly shared? */
SELECT Category, COUNT(*) AS total_items
FROM FreeItems
GROUP BY Category
ORDER BY total_items DESC;


/* Q16. Which rooms are currently unavailable? */
SELECT 
RoomID, 
Location,
Rent
FROM Rooms
WHERE Availability = 'NO';




