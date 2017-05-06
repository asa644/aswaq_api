SELECT Items.id, Items.itemdescription, Items.itemmodel, Items.itemsize
FROM Items
INNER JOIN Color_items ON Color_Items.item_id=Items.id;
