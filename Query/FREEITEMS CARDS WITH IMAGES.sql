SELECT
    freeitemid,
    itemname,
    category,
    giverid,
    CASE MOD(freeitemid - 1, 10)
        WHEN 0 THEN '#APP_FILES#FreeItems/item1.jpg'
        WHEN 1 THEN '#APP_FILES#FreeItems/item2.jpg'
        WHEN 2 THEN '#APP_FILES#FreeItems/item3.jpg'
        WHEN 3 THEN '#APP_FILES#FreeItems/item4.jpg'
        WHEN 4 THEN '#APP_FILES#FreeItems/item5.jpg'
        WHEN 5 THEN '#APP_FILES#FreeItems/item6.jpg'
        WHEN 6 THEN '#APP_FILES#FreeItems/item7.jpg'
        WHEN 7 THEN '#APP_FILES#FreeItems/item8.jpg'
        WHEN 8 THEN '#APP_FILES#FreeItems/item9.jpg'
        WHEN 9 THEN '#APP_FILES#FreeItems/item10.jpg'
    END AS image_url
FROM freeitems
ORDER BY freeitemid;
