class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :setbag
  acts_as_token_authenticatable
  has_many :billing_infos
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

private
  def setbag
   order =  self.orders.create(:orderStatus => 'pending')
   order.save!
  end
end

