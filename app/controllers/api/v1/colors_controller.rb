class Api::V1::ColorsController < Api::V1::BaseController

  before_action :set_color, only: [ :show, :update, :destroy ]

  def index
    @colors = policy_scope(Color)
  end

  def create
    @color = color.new(color_params)
    # @color = color.find(params[:color_id])
    authorize @color
    if @color.save
      render json: { created: 'success', color: @color }, status: :created
    else
      render_error
    end
  end

  def show
  end
  def update
    if @color.update(color_params)
      render :show
    else
      render_error
    end
  end
  def destroy
        # @color = color.find(params[:color_id])

    @color.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end

  private
  def color_params
    params.permit(:colorvalue)
  end


  def render_error
    render json: { errors: @color.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_color
    @color = Color.find(params[:id])
    authorize @color  # For Pundit
  end
end
