class Payment < ApplicationRecord
  belongs_to :billing_info
  belongs_to :order
  enum paymentType: [:credit, :cash, :debit]

end
