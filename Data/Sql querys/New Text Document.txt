SELECT
  roomid,
  roomtype,
  location,
  rent,
  availability,
  CASE MOD(roomid - 1, 10)
    WHEN 0 THEN '#APP_FILES#Rooms/room1.jpg'
    WHEN 1 THEN '#APP_FILES#Rooms/room2.jpg'
    WHEN 2 THEN '#APP_FILES#Rooms/room3.jpg'
    WHEN 3 THEN '#APP_FILES#Rooms/room4.jpg'
    WHEN 4 THEN '#APP_FILES#Rooms/room5.jpg'
    WHEN 5 THEN '#APP_FILES#Rooms/room6.jpg'
    WHEN 6 THEN '#APP_FILES#Rooms/room7.jpg'
    WHEN 7 THEN '#APP_FILES#Rooms/room8.jpg'
    WHEN 8 THEN '#APP_FILES#Rooms/room9.jpg'
    WHEN 9 THEN '#APP_FILES#Rooms/room10.jpg'
  END AS image_url
FROM rooms
ORDER BY roomid;
