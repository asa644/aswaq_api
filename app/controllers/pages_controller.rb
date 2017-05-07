class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end
#   def check
#     # @payment = Payment.new(payment_params)
#     # @payment.user = current_user
#     # @branch = Branch.find(params[:branch_id])
#     if params[:billing_info_id] == nil
#       @payment.update(paymentType: 'cash')
#     end
#     if @payment.save
#     @payment.order.update(orderStatus: 'accepted')
#     # insert new order
#     @payment.update(paymentAmount: @payment.order.orderInvoice)
#     @payment.order.update(items: nil)
#       # @payment.order.has_items.where(order_id: @payment.order.id).destroy_all
# # post.paragraphs.delete(Paragraph.find(paragraph_id))
#       render json: { created: 'success', payment: @payment }, status: :created
#     else
#      @payment.order.update(orderStatus: 'rejected')
#       render_error
#     end
#   end
end
