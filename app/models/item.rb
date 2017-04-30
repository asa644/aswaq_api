class Item < ApplicationRecord
  belongs_to :user
  belongs_to :branch
  has_many :belong
  has_many :categories, through: :belong
  has_many :available
  has_many :branches, through: :available
  has_many :has_items
  has_many :orders, through: :has_items
  has_many :color_item
  has_many :colors, through: :color_item

  mount_uploader :itemPhoto, PhotoUploader
end
