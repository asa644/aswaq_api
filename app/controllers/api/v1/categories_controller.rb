class Api::V1::CategoriesController < Api::V1::BaseController

  before_action :set_category, only: [ :show, :update, :destroy ]

  def index
    @categories = policy_scope(Category)
  end

  def create
    @category = Category.new(category_params)
    # @branch = Branch.find(params[:branch_id])
    authorize @category
    if @category.save
      render json: { created: 'success', category: @category }, status: :created
    else
      render_error
    end
  end

  def show
        # @branch = Branch.find(params[:branch_id])

  end
  def update
        # @branch = Branch.find(params[:branch_id])
    if @category.update(category_params)
      render :show
    else
      render_error
    end
  end
  def destroy
        # @branch = Branch.find(params[:branch_id])

    @category.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end

  private
  def category_params
    params.require(:category).permit(:categoryName)
  end


  def render_error
    render json: { errors: @category.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_category
    @category = Category.find(params[:id])
    authorize @category  # For Pundit
  end
end
