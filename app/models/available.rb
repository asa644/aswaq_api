class Available < ApplicationRecord
  belongs_to :item
  belongs_to :branch
end
