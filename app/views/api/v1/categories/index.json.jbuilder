json.array! @categories do |category|
  json.extract! category, :id, :categoryName, :items
end
