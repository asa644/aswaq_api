class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def check
    @user = User.find(params[:user_id])
    @order = @user.orders.where.has {orderStatus == 'pending'}.first
    s = OrderItem.all.where(order_id: @order.id)
    raise 'eh'
  end
end
