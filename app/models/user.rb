class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :setbag
  acts_as_token_authenticatable
  has_many :billing_infos, dependent: :destroy
  has_many :orders, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

private
  def setbag
   order =  self.orders.create(:orderStatus => 'pending', :orderInvoice => 0.0)
   order.save!
  end
end

