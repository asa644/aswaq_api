class Api::V1::OrdersController < Api::V1::BaseController

  before_action :set_order, only: [ :show, :update, :destroy ]

  def index
    @orders = policy_scope(Order)
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    # @branch = Branch.find(params[:branch_id])
    authorize @order
    if @order.save
      render json: { created: 'success', order: @order }, status: :created
    else
      render_error
    end
  end

  def show
        # @branch = Branch.find(params[:branch_id])

  end
  def update
        # @branch = Branch.find(params[:branch_id])
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
    params.require(:order).permit(:orderStatus, :orderInvoice)
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
