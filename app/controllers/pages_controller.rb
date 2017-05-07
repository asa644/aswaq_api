class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end
  # def check
  #   item = Item.find(params[:item_id])
  #   user = User.find(params[:user_id])
  #   color = params[:color]
  #   quantity = params[:quantity]
  #   if quantity.to_i > item.itemstockqty
  #     render json: { failed: "There are only #{item.itemstockqty} left in stock"}, status: :failed
  #   else
  #     user.orders.first.items << item
  #     price = user.orders.first.orderInvoice + item.itemprice
  #     user.orders.first.update(orderInvoice: price)
  #     ss = HasItem.where(item_id: item.id, order_id: user.orders.first.id).update(color: color, quantity: quantity)
  #     # raise 'eh'
  #     # raise 'he'
  #     # order = user.orders.first
  #     # order.update(orderInvoice: order.orderInvoice+item.itemprice)
  #     # s = HasItem.where(item_id: params[:item_id], order_id: user.orders.first.id).first
  #     #   s.update(quantity: params[:quantity], color: params[:color])
  #       render json: { created: true}, status: :created
  #   end


  # end
end
