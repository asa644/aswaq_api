json.array! @payments do |payment|
  json.extract! payment, :id, :created_at, :paymentType, :paymentAmount
end
