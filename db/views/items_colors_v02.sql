SELECT Colors.colorValue,items.id , items.itemmodel, items.itemprice, items.itemPhoto, items.created_at, items.itemdescription
FROM Items
    INNER JOIN Color_Items
        ON items.id=color_items.item_id
    INNER JOIN Colors
        ON colors.id=color_items.color_id
