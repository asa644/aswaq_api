class Api::V1::BillingInfosController < Api::V1::BaseController

  before_action :set_billingInfo, only: [ :show, :update, :destroy ]

  def index
    @billing_infos = policy_scope(BillingInfo)
  end

  def create
    @billingInfo = BillingInfo.new(billingInfo_params)
    # @billingInfo = billingInfo.find(params[:billingInfo_id])
    authorize @billingInfo
    if @billingInfo.save
      render json: { created: 'success', billingInfo: @billingInfo }, status: :created
    else
      render_error
    end
  end

  def show
  end
  def update
    if @billingInfo.update(billingInfo_params)
      render :show
    else
      render_error
    end
  end
  def destroy
        # @billingInfo = billingInfo.find(params[:billingInfo_id])

    @billingInfo.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end

  private
  def billingInfo_params
    params.permit(:BillingInfoCardNumber, :BillingInfoCvv, :BillingInfoBankName, :BillingInfoBankBranch, :user_id)
  end


  def render_error
    render json: { errors: @billingInfo.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_billingInfo
    @billingInfo = BillingInfo.find(params[:id])
    authorize @billingInfo  # For Pundit
  end
end
