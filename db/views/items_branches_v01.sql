SELECT branches.branchName,
items.id,
items.itemmodel,
items.itemprice,
items.created_at,
items.itemdescription
FROM items
 JOIN availables ON items.id = availables.item_id
 JOIN branches ON branches.id = availables.branch_id
