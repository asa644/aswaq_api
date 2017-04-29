class Api::V1::BranchesController < Api::V1::BaseController

  before_action :set_branch, only: [ :show, :update, :destroy ]

  def index
    @branches = policy_scope(Branch)
  end

  def create
    @branch = Branch.new(branch_params)
    # @branch = Branch.find(params[:branch_id])
    authorize @branch
    if @branch.save
      render json: { created: 'success', branch: @branch }, status: :created
    else
      render_error
    end
  end

  def show
  end
  def update
    if @branch.update(branch_params)
      render :show
    else
      render_error
    end
  end
  def destroy
        # @branch = Branch.find(params[:branch_id])

    @branch.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end

  private
  def branch_params
    params.permit(:branchName)
  end


  def render_error
    render json: { errors: @branch.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_branch
    @branch = Branch.find(params[:id])
    authorize @branch  # For Pundit
  end
end
