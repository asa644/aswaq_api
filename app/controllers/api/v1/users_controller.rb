class Api::V1::UsersController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  def index
    # @users = User.order(:created_at => :desc)
    @users = User.all
  end

  def billing
    @user = User.find(params[:id])
    @billings = @user.billing_infos
  end

  def show
    @user = User.find(params[:id])
    @orders = @user.orders.where.has {orderStatus == 'pending'}
  end
end
