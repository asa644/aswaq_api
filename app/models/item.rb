class Item < ApplicationRecord
  belongs_to :user
  belongs_to :branch
  has_many :belong
  has_many :categories, through: :belong
  has_many :available
  has_many :branches, through: :available
  has_many :has_items
  has_many :orders, through: :has_items

  mount_uploader :itemPhoto, PhotoUploader
end
