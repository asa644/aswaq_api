json.array! @category.items do |item|
  json.extract! item, :id, :created_at, :inOrder, :itemdescription, :itemmodel, :itemsize, :itemstockqty, :itemprice, :categories, :branches, :colors, :itemPhoto
end

