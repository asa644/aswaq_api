json.array! @items do |item|
  json.extract! item, :id, :description, :model, :size, :color, :stockqty, :price, :user_id
end
