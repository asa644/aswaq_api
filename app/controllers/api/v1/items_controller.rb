class Api::V1::ItemsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show, :search ]

  before_action :set_item, only: [ :show, :update, :destroy ]

  def index
    @items = policy_scope(Item).order(:created_at => :desc)
  end
  def search
    skip_authorization
    if params[:value] != nil
      if params[:date]!= nil
      @items = Item.where("#{params[:search]} #{params[:sign]} ? AND created_at #{params[:datesign]} ?", params[:value], params[:date]).order(params[:search] => params[:AD])
      else
      @items = Item.where("#{params[:search]} #{params[:sign]} ?", params[:value])
      end
    else
    @items = policy_scope(Item).order(params[:search] => params[:AD])
    end
  end
  def list
    skip_authorization
    @users = User.joins(:orders).where.has {orders.orderStatus == 'pending' }
  end

  # def check
  #   @item = Item.find(params[:id])
  #   if @item is in @user.order
  #     @user.order.items.where(item: @item).destroy
  #   else
  #     @user.order.items.create!(@item)
  #     add item to the order
  #   end
  # end
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
    params.permit(:branches, :colors, :categories, :itemdescription, :itemphoto, :photo_cache, :itemmodel, :itemsize, :itemstockqty, :itemprice)
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
