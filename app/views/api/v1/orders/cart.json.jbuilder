json.array! @cart do |item|
  json.extract! item, :itemmodel, :itemphoto, :itemprice, :quantity, :id, :color
end
