class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def check
    # HasItem.where(order_id: params[:order_id] and item_id: params[:item_id])
  end

end
