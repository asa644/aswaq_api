class BillingInfo < ApplicationRecord
  belongs_to :user
  has_many :payments
  has_many :orders, through: :payments
  validates_format_of :BillingInfoCvv, :with => /\b[0-9]{3}\b/i, :on => :create
  validates_format_of :billingInfoExp, :with => /(0[1-9]|1[0-2])\/?([0-9]{4}|[0-9]{2})/i, :on => :create

end
