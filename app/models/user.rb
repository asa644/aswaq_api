class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_token_authenticatable
  has_many :billing_infos
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

