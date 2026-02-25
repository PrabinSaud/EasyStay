SELECT
  itemid,
  itemname,
  category,
  itemcondition,
  price,
  CASE MOD(itemid - 1, 10)
    WHEN 0 THEN '#APP_FILES#Furnitures/furniture1.jpg'
    WHEN 1 THEN '#APP_FILES#Furnitures/furniture7.jpg'
    WHEN 2 THEN '#APP_FILES#Furnitures/furniture3.jpg'
    WHEN 3 THEN '#APP_FILES#Furnitures/furniture4.jpg'
    WHEN 4 THEN '#APP_FILES#Furnitures/furniture5.jpg'
    WHEN 5 THEN '#APP_FILES#Furnitures/furniture6.jpg'
    WHEN 6 THEN '#APP_FILES#Furnitures/furniture7.jpg'
    WHEN 7 THEN '#APP_FILES#Furnitures/furniture8.jpg'
    WHEN 8 THEN '#APP_FILES#Furnitures/furniture9.jpg'
    WHEN 9 THEN '#APP_FILES#Furnitures/furniture10.jpg'
  END AS image_url
FROM furnitures
ORDER BY itemid;
