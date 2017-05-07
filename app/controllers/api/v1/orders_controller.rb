class Api::V1::OrdersController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_order, only: [ :show, :update, :destroy ]
  # before_action :authenticate_user!

  def index
    @orders = policy_scope(Order)
  end
  def show

  end
    def cart
    @user = User.find(params[:user_id])
    order = @user.orders.where.has {orderStatus == 'pending'}.first
    @cart = OrderItem.all.where(order_id: order.id)
  end

  def add
    item = Item.find(params[:item_id])
    user = User.find(params[:user_id])
    color = params[:color]
    quantity = params[:quantity]
    if quantity.to_i > item.itemstockqty
      render json: { failed: 'ITEM QUANTITY SHOULD NOT BE MORE THAN ITEM STOCKQTY'}, status: :failed
    else
      user.orders.first.items << item
      price = user.orders.first.orderInvoice + item.itemprice
      user.orders.first.update(orderInvoice: price)
      # order = user.orders.first
      # order.update(orderInvoice: order.orderInvoice+item.itemprice)
      s = HasItem.where(item_id: params[:item_id], order_id: user.orders.first.id).first
        s.update(quantity: params[:quantity], color: params[:color])
        render json: { created: true}, status: :created
    end
  end

  def remove
    item = Item.find(params[:item_id])
    user = User.find(params[:user_id])
    user.orders.first.has_items.where(item_id: params[:item_id]).destroy_all
  end
  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.items.each do |item|
      item.update(inOrder: true)
    end
    # @branch = Branch.find(params[:branch_id])
    authorize @order
    if @order.save
      render json: { created: 'success', order: @order }, status: :created
    else
      render_error
    end
  end
  def check
    boo = HasItem.where(order_id: params[:order_id], item_id: params[:item_id]).empty?
    render json: { inOrder?: !boo }
  end

  def update

    if @order.update(order_params)
      render :show
    else
      render_error
    end
  end
  def destroy
        # @branch = Branch.find(params[:branch_id])

    @order.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end

  private
  def order_params
    params.require(:order).permit(:orderStatus, :orderInvoice, :items, :user)
  end

  def current_user_order
    "order#{current_user.id}"
  end


  def render_error
    render json: { errors: @order.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_order
    @order = Order.find(params[:id])
    authorize @order  # For Pundit
  end
end
