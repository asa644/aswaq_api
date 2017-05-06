class Api::V1::HasItemsController < Api::V1::BaseController

  before_action :set_HasItem, only: [ :show, :update, :destroy ]

  def index
    @billing_infos = policy_scope(HasItem)
  end

  def create
    @HasItem = HasItem.new(HasItem_params)
    @HasItem.order = current_user.order
    authorize @HasItem
    if @HasItem.save
      render json: { created: 'success', HasItem: @HasItem }, status: :created
    else
      render_error
    end
  end

  def show
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
    params.permit(:item_id, :quantity, :color)
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
