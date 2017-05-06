class Api::V1::OrdersController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_order, only: [ :show, :update, :destroy ]
  # before_action :authenticate_user!

  def index
    @orders = policy_scope(Order)
  end
  def show

  end
  def add
    item = Item.find(params[:item_id])
    user = User.find(params[:user_id])
    user.orders.first.items << item
    render json: { created: true}, status: :created
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
