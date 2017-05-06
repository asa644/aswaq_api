class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end
  def remove
    item = Item.find(params[:item_id])
    user = User.find(params[:user_id])
    user.orders.first.has_items.where(item_id: params[:item_id]).destroy_all
  end
end
