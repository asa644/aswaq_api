class Category < ApplicationRecord
  has_many :belong
  has_many :items, through: :belong
end
