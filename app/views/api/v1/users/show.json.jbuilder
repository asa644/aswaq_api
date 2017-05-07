  json.array! @orders do |order|
    json.extract! order, :id, :orderStatus, :orderInvoice, :created_at, :items, :has_items
end

