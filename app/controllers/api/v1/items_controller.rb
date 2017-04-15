class Api::V1::ItemsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]

  before_action :set_item, only: [ :show, :update, :destroy ]

  def index
    @items = policy_scope(Item)
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    # @branch = Branch.find(params[:branch_id])
    authorize @item
    if @item.save
      render json: { created: 'success', item: @item }, status: :created
    else
      render_error
    end
  end

  def show
        # @branch = Branch.find(params[:branch_id])

  end
  def update
        # @branch = Branch.find(params[:branch_id])
    if @item.update(item_params)
      render :show
    else
      render_error
    end
  end
  def destroy
        # @branch = Branch.find(params[:branch_id])

    @item.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end

  private
  def item_params
    params.require(:item).permit(:branch_id, :itemDescription, :itemModel, :itemSize, :itemColor, :itemStockqty, :itemPrice)
  end


  def render_error
    render json: { errors: @item.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_item
    @item = Item.find(params[:id])
    authorize @item  # For Pundit
  end
end
