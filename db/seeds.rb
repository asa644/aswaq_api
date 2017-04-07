# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails dbseed command (or created alongside the database with dbsetup).
#
# Examples
#
#   movies = Movie.create([{ name 'Star Wars' }, { name 'Lord of the Rings' }])
#   Character.create(name 'Luke', movie movies.first)
# user = User.find_by_email("ahmad.msouti@hotmail.com")

firstItem = Item.new(description: "this is a fantastic shirt", model: "new model", size: "Large", color: "Black", stockqty: 3, price: 1.5, user_id: 1)
firstItem.save
second = Item.new(description: "this is a fantastic skirt", model: "new skirt", size: "petite", color: "orange", stockqty: 5, price: 100.5, user_id: 1)
second.save
third = Item.new(description: "this is a fantastic pants", model: "new something", size: "huge", color: "brown", stockqty: 3, price: 1.5, user_id: 1)
third.save


