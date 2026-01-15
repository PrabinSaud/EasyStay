use easystay;

/* =========================================================
   EASY STAY – STUDENT ACTIVITY & ENGAGEMENT ANALYTICS
   QUESTIONS ONLY (COMMENTED)
   ========================================================= */


/* Q1. How many total students are registered in the system? */
SELECT
	COUNT(*) AS Total_registered_student
FROM students;

/* Q2. How many students are active on the platform? */
SELECT 
	COUNT(DISTINCT s.StudentID) AS active_students
FROM Students s
LEFT JOIN Rooms r 
ON s.StudentID = r.StudentID
LEFT JOIN Furnitures f 
ON s.StudentID = f.SellerID
LEFT JOIN FreeItems fi 
ON s.StudentID = fi.GiverID
WHERE r.RoomID IS NOT NULL
OR f.ItemID IS NOT NULL
OR fi.FreeItemID IS NOT NULL;

/* Q3. How many students are completely inactive (no rooms, no furniture, no free items)? */
SELECT 
	COUNT(DISTINCT s.StudentID) AS active_students
FROM Students s
LEFT JOIN Rooms r 
ON s.StudentID = r.StudentID
LEFT JOIN Furnitures f 
ON s.StudentID = f.SellerID
LEFT JOIN FreeItems fi 
ON s.StudentID = fi.GiverID
WHERE r.RoomID IS NULL
OR f.ItemID IS NULL
OR fi.FreeItemID IS NULL;

/* Q4. What percentage of students are active vs inactive? */
SELECT
ROUND(
(COUNT(DISTINCT CASE 
WHEN r.RoomID IS NOT NULL 
OR f.ItemID IS NOT NULL 
OR fi.FreeItemID IS NOT NULL 
THEN s.StudentID END) * 100.0) / COUNT(*),
2
) AS active_percentage
FROM Students s
LEFT JOIN Rooms r 
ON s.StudentID = r.StudentID
LEFT JOIN Furnitures f 
ON s.StudentID = f.SellerID
LEFT JOIN FreeItems fi 
ON s.StudentID = fi.GiverID;

/* Q5. How many students have listed at least one room? */
SELECT 
	s.StudentID,
	s.FirstName,
	s.LastName,
	COUNT(r.RoomID) as CountRoom
FROM students as s
LEFT JOIN rooms as r
ON s.StudentID = r.StudentID
GROUP BY StudentID
HAVING COUNT(r.RoomID) > 1;


/* Q6. How many students are selling furniture items? */

SELECT 
COUNT(DISTINCT s.StudentID) AS CountStudents
FROM Students s
JOIN Furnitures f
ON s.StudentID = f.SellerID;

/* Q7. How many students are giving free items? */
SELECT 
COUNT(DISTINCT s.StudentID) AS CountStudents
FROM Students s
JOIN freeitems AS fr
ON s.StudentID = fr.GiverID;

/* Q8. How many students are using only one feature (room OR furniture OR free items)? */
SELECT 
COUNT(*) AS OneFeatureUsers
FROM (
  SELECT 
    s.StudentID,
    (COUNT(DISTINCT r.RoomID) > 0)
  + (COUNT(DISTINCT f.ItemID) > 0)
  + (COUNT(DISTINCT fi.FreeItemID) > 0) AS feature_count
  FROM Students s
  LEFT JOIN Rooms r
  ON s.StudentID = r.StudentID
  LEFT JOIN Furnitures f
  ON s.StudentID = f.SellerID
  LEFT JOIN FreeItems fi 
  ON s.StudentID = fi.GiverID
  GROUP BY s.StudentID
  HAVING feature_count = 1
) AS t;

/* Q9. How many students are using exactly two features? */
SELECT COUNT(*) AS TwoFeatureUsers
FROM (
  SELECT 
    s.StudentID,
    (COUNT(DISTINCT r.RoomID) > 0)
  + (COUNT(DISTINCT f.ItemID) > 0)
  + (COUNT(DISTINCT fi.FreeItemID) > 0) AS feature_count
  FROM Students s
  LEFT JOIN Rooms r
  ON s.StudentID = r.StudentID
  LEFT JOIN Furnitures f
  ON s.StudentID = f.SellerID
  LEFT JOIN FreeItems fi
  ON s.StudentID = fi.GiverID
  GROUP BY s.StudentID
  HAVING feature_count = 2
) AS t;

/* Q10. How many students are active in all three modules (rooms, furniture, free items)? */
SELECT 
COUNT(*) AS ThreeFeatureUsers
FROM (
  SELECT 
    s.StudentID,
    (COUNT(DISTINCT r.RoomID) > 0)
  + (COUNT(DISTINCT f.ItemID) > 0)
  + (COUNT(DISTINCT fi.FreeItemID) > 0) AS feature_count
  FROM Students s
  LEFT JOIN Rooms r
  ON s.StudentID = r.StudentID
  LEFT JOIN Furnitures f
  ON s.StudentID = f.SellerID
  LEFT JOIN FreeItems fi
  ON s.StudentID = fi.GiverID
  GROUP BY s.StudentID
  HAVING feature_count = 3
) AS t;

/* Q11. Which students are the most active contributors overall? */
SELECT 
  s.StudentID,
  s.FirstName,
  COUNT(DISTINCT r.RoomID)
+ COUNT(DISTINCT f.ItemID)
+ COUNT(DISTINCT fi.FreeItemID) AS total_activities
FROM Students s
LEFT JOIN Rooms r 
ON s.StudentID = r.StudentID
LEFT JOIN Furnitures f 
ON s.StudentID = f.SellerID
LEFT JOIN FreeItems fi 
ON s.StudentID = fi.GiverID
GROUP BY s.StudentID, s.FirstName
ORDER BY total_activities DESC;

/* Q12. What is the average number of activities per student? */
SELECT 
  ROUND(AVG(activity_count), 2) AS AvgActivitiesPerStudent
FROM (
  SELECT 
    s.StudentID,
    COUNT(DISTINCT r.RoomID)
    + COUNT(DISTINCT f.ItemID)
    + COUNT(DISTINCT fi.FreeItemID) AS activity_count
  FROM Students s
  LEFT JOIN Rooms r
  ON s.StudentID = r.StudentID
  LEFT JOIN Furnitures f
  ON s.StudentID = f.SellerID
  LEFT JOIN FreeItems fi
  ON s.StudentID = fi.GiverID
  GROUP BY s.StudentID
) AS t;


/* Q13. Which students have listed rooms but no furniture or free items? */
SELECT 
  s.StudentID,
  s.FirstName,
  s.LastName
FROM Students s
JOIN Rooms r 
ON s.StudentID = r.StudentID
LEFT JOIN Furnitures f 
ON s.StudentID = f.SellerID
LEFT JOIN FreeItems fi 
ON s.StudentID = fi.GiverID
WHERE f.ItemID IS NULL
AND fi.FreeItemID IS NULL;


/* Q14. Which students are only giving free items and nothing else? */
SELECT 
  s.StudentID,
  s.FirstName,
  s.LastName
FROM Students s
JOIN FreeItems fi 
ON s.StudentID = fi.GiverID
LEFT JOIN Rooms r 
ON s.StudentID = r.StudentID
LEFT JOIN Furnitures f 
ON s.StudentID = f.SellerID
WHERE r.RoomID IS NULL
AND f.ItemID IS NULL;

/* Q15. Which students are only selling furniture and nothing else? */
SELECT 
  s.StudentID,
  s.FirstName,
  s.LastName
FROM Students s
JOIN Furnitures f 
ON s.StudentID = f.SellerID
LEFT JOIN Rooms r 
ON s.StudentID = r.StudentID
LEFT JOIN FreeItems fi 
ON s.StudentID = fi.GiverID
WHERE r.RoomID IS NULL
AND fi.FreeItemID IS NULL;

/* Q16. Which students are active but have not listed any rooms? */
SELECT DISTINCT
  s.StudentID,
  s.FirstName,
  s.LastName
FROM Students s
LEFT JOIN Rooms r 
ON s.StudentID = r.StudentID
WHERE r.RoomID IS NULL
AND (
    s.StudentID IN (SELECT SellerID FROM Furnitures)
    OR s.StudentID IN (SELECT GiverID FROM FreeItems)
);

/* Q17. How many students own multiple rooms? */
SELECT COUNT(*) AS MultipleRoomOwners
FROM (
  SELECT StudentID
  FROM Rooms
  GROUP BY StudentID
  HAVING COUNT(RoomID) > 1
) AS t;

/* Q18. How many students are selling multiple furniture items? */
SELECT COUNT(*) AS MultipleFurnitureSellers
FROM (
  SELECT SellerID
  FROM Furnitures
  GROUP BY SellerID
  HAVING COUNT(ItemID) > 1
) AS t;

/* Q19. Which colleges have the most active students? */
SELECT 
  s.College,
  COUNT(DISTINCT s.StudentID) AS ActiveStudents
FROM Students s
LEFT JOIN Rooms r
ON s.StudentID = r.StudentID
LEFT JOIN Furnitures f 
ON s.StudentID = f.SellerID
LEFT JOIN FreeItems fi 
ON s.StudentID = fi.GiverID
WHERE r.RoomID IS NOT NULL
OR f.ItemID IS NOT NULL
OR fi.FreeItemID IS NOT NULL
GROUP BY s.College
ORDER BY ActiveStudents DESC;

/* Q20. What is the activity distribution by college? */
SELECT 
  s.College,
  COUNT(DISTINCT r.RoomID)
  + COUNT(DISTINCT f.ItemID)
  + COUNT(DISTINCT fi.FreeItemID) AS TotalActivities
FROM Students s
LEFT JOIN Rooms r
ON s.StudentID = r.StudentID
LEFT JOIN Furnitures f
ON s.StudentID = f.SellerID
LEFT JOIN FreeItems fi
ON s.StudentID = fi.GiverID
GROUP BY s.College
ORDER BY TotalActivities DESC;

/* =========================
   END OF STUDENT ACTIVITY QUESTIONS
   ========================= */