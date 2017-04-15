json.array! @items do |item|
  json.extract! item, :id, :itemDescription, :itemModel, :itemSize, :itemColor, :itemStockqty, :itemPrice, :user, :categories
end
