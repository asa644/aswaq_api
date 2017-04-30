json.array! @items do |item|
  json.extract! item, :id, :created_at, :itemDescription, :itemModel, :itemSize, :itemColor, :itemStockqty, :itemPrice, :user, :categories, :branches
end
