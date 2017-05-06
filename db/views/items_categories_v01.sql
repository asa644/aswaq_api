SELECT Categories.categoryName, items.id, items.itemmodel, items.itemprice, items.created_at, items.itemdescription
FROM Items
    INNER JOIN Belongs
        ON items.id=Belongs.item_id
    INNER JOIN Categories
        ON categories.id=Belongs.branch_id
