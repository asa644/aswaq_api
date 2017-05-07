SELECT items.id, items.itemphoto, items.itemmodel, items.itemprice, has_items.quantity, has_items.color, has_items.order_id  FROM items, has_items WHERE has_items.item_id=items.id;
