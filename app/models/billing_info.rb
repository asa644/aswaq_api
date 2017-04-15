class BillingInfo < ApplicationRecord
  belongs_to :user
  has_many :payments
  has_many :orders, through: :payments

end
