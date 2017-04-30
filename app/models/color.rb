class Color < ApplicationRecord
  has_many :color_item
  has_many :items, through: :color_item
end
