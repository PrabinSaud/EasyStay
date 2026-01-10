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

/* =========================================================
   EASY STAY – DASHBOARD AVAILABILITY QUERIES
   ========================================================= */


/* Q1. What percentage of total rooms are currently available? */
SELECT 
  ROUND(
    (SUM(CASE WHEN Availability = 'YES' THEN 1 ELSE 0 END) * 100.0) 
    / COUNT(*), 
    2
  ) AS available_percentage
FROM Rooms;


/* Q2. What percentage of rooms are occupied location-wise? */
SELECT 
  Location,
  ROUND(
    (SUM(CASE WHEN Availability = 'NO' THEN 1 ELSE 0 END) * 100.0) 
    / COUNT(*),
    2
  ) AS occupied_percentage
FROM Rooms
GROUP BY Location;


/* Q3. Which location has the highest number of occupied rooms? */
SELECT 
  Location,
  COUNT(*) AS occupied_rooms
FROM Rooms
WHERE Availability = 'NO'
GROUP BY Location
ORDER BY occupied_rooms DESC
LIMIT 1;


/* Q4. Which room type has the lowest availability rate? */
SELECT 
  RoomType,
  ROUND(
    (SUM(CASE WHEN Availability = 'YES' THEN 1 ELSE 0 END) * 100.0) 
    / COUNT(*),
    2
  ) AS availability_rate
FROM Rooms
GROUP BY RoomType
ORDER BY availability_rate ASC
LIMIT 1;


/* Q5. How many rooms changed availability status (YES vs NO)? */
SELECT 
  Availability,
  COUNT(*) AS total_rooms
FROM Rooms
GROUP BY Availability;


/* Q6. Which locations have zero available rooms? */
SELECT 
  Location
FROM Rooms
GROUP BY Location
HAVING SUM(CASE WHEN Availability = 'YES' THEN 1 ELSE 0 END) = 0;


/* Q7. What is the availability trend by room type? */
SELECT 
  RoomType,
  SUM(CASE WHEN Availability = 'YES' THEN 1 ELSE 0 END) AS available_rooms,
  SUM(CASE WHEN Availability = 'NO' THEN 1 ELSE 0 END) AS occupied_rooms
FROM Rooms
GROUP BY RoomType;


/* =========================================================
   EASY STAY – DASHBOARD PRICING & AFFORDABILITY QUERIES
   ========================================================= */


/* Q1. What percentage of rooms fall under ₹5,000 rent? */
SELECT 
ROUND(
(SUM(CASE WHEN Rent < 5000 THEN 1 ELSE 0 END) * 100.0) 
/ COUNT(*),
2
) AS under_5000_percentage
FROM Rooms;


/* Q2. How many rooms are priced between ₹5,000 and ₹8,000? */
SELECT 
  COUNT(*) AS rooms_5000_to_8000
FROM Rooms
WHERE Rent BETWEEN 5000 AND 8000;

/* Q3. Which locations have average rent above overall system average? */
SELECT 
  Location,
  ROUND(AVG(Rent), 2) AS average_rent
FROM Rooms
GROUP BY Location
HAVING AVG(Rent) > (SELECT AVG(Rent) FROM Rooms);


/* Q4. Which room types are most affordable on average? */
SELECT 
  RoomType,
  ROUND(AVG(Rent), 2) AS average_rent
FROM Rooms
GROUP BY RoomType
ORDER BY average_rent ASC;


/* Q5. What is the rent distribution (low, medium, high)? */
SELECT 
CASE
WHEN Rent < 5000 THEN 'LOW'
WHEN Rent BETWEEN 5000 AND 8000 THEN 'MEDIUM'
ELSE 'HIGH'
END AS rent_category,
COUNT(*) AS total_rooms
FROM Rooms
GROUP BY rent_category;


/* Q6. Which students are listing high-rent rooms (> ₹10,000)? */
SELECT 
  s.StudentID,
  s.FirstName,
  s.LastName,
  r.Location,
  r.Rent
FROM Students s
JOIN Rooms r ON s.StudentID = r.StudentID
WHERE r.Rent > 10000;


/* Q7. What is the average rent difference between Single and Double rooms? */
SELECT 
ROUND(
(SELECT AVG(Rent) 
FROM Rooms 
WHERE RoomType = 'Single Room')
-
(SELECT AVG(Rent) 
FROM Rooms 
WHERE RoomType = 'Double Room'),
2
) AS avg_rent_difference;

/* =========================================================
   EASY STAY – ROOM SHARING ANALYTICS
   ========================================================= */


/* Q1. How many total room sharing requests are available in the system? */
SELECT
COUNT(*) AS Total_Roomsharing
FROM roomsharing;

/* Q2. What percentage of rooms support sharing? */
SELECT 
ROUND((COUNT(DISTINCT rs.RoomID) * 100.0) / 
(SELECT COUNT(*) FROM Rooms),2) AS sharing_room_percentage
FROM RoomSharing rs;


/* Q3. What is the average sharing budget per student? */
SELECT
ROUND(AVG(Budget),2) AS AvgBudget
FROM roomsharing;

/* Q4. What is the average sharing budget per room? */
SELECT 
ROUND(AVG(Budget * NumberOfStudents), 2) AS avg_total_budget_per_room
FROM RoomSharing;


/* Q5. Which gender preference is most common in room sharing? */
SELECT 
  Gender,
  COUNT(*) AS total_requests
FROM RoomSharing
GROUP BY Gender
ORDER BY total_requests DESC
LIMIT 1;


/* Q6. What is the distribution of sharing requests by gender? */
SELECT 
  Gender,
  COUNT(*) AS total_requests
FROM RoomSharing
GROUP BY Gender;


/* Q7. What is the most common number of students sharing a room? */
SELECT 
  NumberOfStudents,
  COUNT(*) AS total_requests
FROM RoomSharing
GROUP BY NumberOfStudents
ORDER BY total_requests DESC
LIMIT 1;


/* Q8. What is the average number of students per shared room? */
SELECT 
  ROUND(AVG(NumberOfStudents), 2) AS avg_students_per_room
FROM RoomSharing;


/* Q9. Which rooms allow the highest number of students to share? */
SELECT 
  RoomID,
  NumberOfStudents
FROM RoomSharing
ORDER BY NumberOfStudents DESC;


/* Q10. Which locations have the highest number of room sharing requests? */
SELECT 
  r.Location,
  COUNT(*) AS total_requests
FROM RoomSharing rs
JOIN Rooms r 
ON rs.RoomID = r.RoomID
GROUP BY r.Location
ORDER BY total_requests DESC;


/* Q11. What is the average sharing budget by gender preference? */
SELECT 
  Gender,
  ROUND(AVG(Budget), 2) AS avg_budget
FROM RoomSharing
GROUP BY Gender;


/* Q12. What is the average sharing budget by number of students? */
SELECT 
  NumberOfStudents,
  ROUND(AVG(Budget), 2) AS avg_budget
FROM RoomSharing
GROUP BY NumberOfStudents;


/* Q13. Which room types are most frequently used for sharing? */
SELECT 
  r.RoomType,
  COUNT(*) AS total_requests
FROM RoomSharing rs
JOIN Rooms r 
ON rs.RoomID = r.RoomID
GROUP BY r.RoomType
ORDER BY total_requests DESC;


/* Q14. How many sharing requests are linked to unavailable rooms? */
SELECT 
  COUNT(*) AS unavailable_sharing_requests
FROM RoomSharing rs
JOIN Rooms r 
ON rs.RoomID = r.RoomID
WHERE r.Availability = 'NO';


/* Q15. Which rooms have unrealistic sharing budgets (total budget < rent)? */
SELECT 
  r.RoomID,
  r.Location,
  r.Rent,
  rs.Budget * rs.NumberOfStudents AS total_budget
FROM RoomSharing rs
JOIN Rooms r 
ON rs.RoomID = r.RoomID
WHERE rs.Budget * rs.NumberOfStudents < r.Rent;


/* Q16. What is the total sharing budget per room (budget × number of students)? */
SELECT 
  RoomID,
  Budget * NumberOfStudents AS total_budget
FROM RoomSharing;


/* Q17. Which locations have high sharing demand but low room availability? */
SELECT 
  r.Location,
  COUNT(rs.ShareID) AS sharing_requests,
  SUM(CASE 
  WHEN r.Availability = 'YES' THEN 1 
  ELSE 0 
  END) AS available_rooms
FROM Rooms r
LEFT JOIN RoomSharing rs 
ON r.RoomID = rs.RoomID
GROUP BY r.Location
HAVING sharing_requests > available_rooms;


/* Q18. What percentage of sharing requests are gender-specific (MALE or FEMALE)? */
SELECT 
ROUND(
(SUM(CASE 
WHEN Gender IN ('MALE','FEMALE') THEN 1 
ELSE 0 
END) * 100.0)/ COUNT(*),2) AS gender_specific_percentage
FROM RoomSharing;


/* Q19. Which sharing requests exceed normal group size (more than 4 students)? */
SELECT 
  *
FROM RoomSharing
WHERE NumberOfStudents > 4;


/* Q20. Which students own rooms that are frequently requested for sharing? */
SELECT 
  s.StudentID,
  s.FirstName,
  COUNT(rs.ShareID) AS total_requests
FROM Students s
JOIN Rooms r 
ON s.StudentID = r.StudentID
JOIN RoomSharing rs 
ON r.RoomID = rs.RoomID
GROUP BY s.StudentID, s.FirstName
ORDER BY total_requests DESC;







