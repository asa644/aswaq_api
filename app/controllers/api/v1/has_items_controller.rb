class Api::V1::HasItemsController < Api::V1::BaseController

  before_action :set_HasItem, only: [ :show, :update, :destroy ]

  def index
    @hasitems = HasItem.all
  end

  def create
    @HasItem = HasItem.find(HasItem_params)
    Order.where(item_id: params[:item_id], user_id: params[:user_id])
    @HasItem.update(order_id: current_user.order.id)
    @HasItem.order_id = current_user.order.id
    authorize @HasItem
    if @HasItem.save
      render json: { created: 'success', HasItem: @HasItem }, status: :created
    else
      render_error
    end
  end

  def show
    Order.where(item_id: params[:item_id], user_id: params[:user_id])
  end
  def update
    if @HasItem.update(HasItem_params)
      render :show
    else
      render_error
    end
  end
  def destroy
        # @HasItem = HasItem.find(params[:HasItem_id])

    @HasItem.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end

  private
  def HasItem_params
    params.permit(:item_id, :quantity, :color, :user_id)
  end


  def render_error
    render json: { errors: @HasItem.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_HasItem
    @HasItem = HasItem.find(params[:id])
    authorize @HasItem  # For Pundit
  end
end
