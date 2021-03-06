class Api::V1::PaymentsController < Api::V1::BaseController

  before_action :set_payment, only: [ :show, :update, :destroy ]

  def index
    @payments = policy_scope(Payment)
  end

  def create
    @payment = Payment.new(payment_params)
    @order = Order.find(params[:order_id])
    # @payment.user = current_user
    # @branch = Branch.find(params[:branch_id])
    # authorize @payment
    if params[:billing_info_id] == nil
      @payment.update(paymentType: 'cash')
    end
    if @payment.save
    @order.update(orderStatus: 'accepted')
    @payment.update(paymentAmount: @order.orderInvoice)
      HasItem.where(order_id: @order.id).destroy_all
      # s.save
      render json: { created: true, payment: @payment }, status: :created
    else
     @order.update(orderStatus: 'rejected')
      render_error
    end
  end
  def show
        # @branch = Branch.find(params[:branch_id])

  end
  def update
        # @branch = Branch.find(params[:branch_id])
    if @payment.update(payment_params)
      render :show
    else
      render_error
    end
  end
  def destroy
        # @branch = Branch.find(params[:branch_id])

    @payment.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end

  private
  def payment_params
    params.permit(:order_id, :billing_info_id)
  end

  def render_error
    render json: { errors: @payment.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_payment
    @payment = Payment.find(params[:id])
    authorize @payment  # For Pundit
  end
end
