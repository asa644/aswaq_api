json.array! @items do |item|
  json.extract! item, :id, :created_at, :itemdescription, :itemmodel, :itemsize, :itemcolor, :itemstockqty, :itemprice, :user, :categories, :branches
end
