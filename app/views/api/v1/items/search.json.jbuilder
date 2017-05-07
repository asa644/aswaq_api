if !@items.empty?
json.array! @items do |item|
  json.extract! item, :id, :created_at, :itemdescription, :itemmodel, :itemsize, :itemstockqty, :itemprice, :user, :categories, :branches, :colors, :itemphoto
end
end
