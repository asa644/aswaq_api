json.array! @users do |user|
  json.array! user.orders do |order|
    json.extract! order, :orderStatus
end
end
