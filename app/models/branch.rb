class Branch < ApplicationRecord
  has_many :available
  has_many :items, through: :available
end
