class Order < ApplicationRecord
  belongs_to :user
  enum orderStatus: [:pending, :accepted, :rejected]
  has_many :has_items
  has_many :items, through: :has_items
  has_many :payments
  has_many :billing_infos, through: :payments
end
