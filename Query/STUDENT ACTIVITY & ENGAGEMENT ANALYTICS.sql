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


/* Q6. How many students are selling furniture items? */


/* Q7. How many students are giving free items? */


/* Q8. How many students are using only one feature (room OR furniture OR free items)? */


/* Q9. How many students are using exactly two features? */


/* Q10. How many students are active in all three modules (rooms, furniture, free items)? */


/* Q11. Which students are the most active contributors overall? */
SELECT 
  s.StudentID,
  s.FirstName,
  COUNT(DISTINCT r.RoomID)
+ COUNT(DISTINCT f.ItemID)
+ COUNT(DISTINCT fi.FreeItemID) AS total_activities
FROM Students s
LEFT JOIN Rooms r ON s.StudentID = r.StudentID
LEFT JOIN Furnitures f ON s.StudentID = f.SellerID
LEFT JOIN FreeItems fi ON s.StudentID = fi.GiverID
GROUP BY s.StudentID, s.FirstName
ORDER BY total_activities DESC;

/* Q12. What is the average number of activities per student? */


/* Q13. Which students have listed rooms but no furniture or free items? */


/* Q14. Which students are only giving free items and nothing else? */


/* Q15. Which students are only selling furniture and nothing else? */


/* Q16. Which students are active but have not listed any rooms? */


/* Q17. How many students own multiple rooms? */


/* Q18. How many students are selling multiple furniture items? */


/* Q19. Which colleges have the most active students? */


/* Q20. What is the activity distribution by college? */


/* =========================
   END OF STUDENT ACTIVITY QUESTIONS
   ========================= */
