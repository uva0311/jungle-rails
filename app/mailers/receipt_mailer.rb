class ReceiptMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt(order)
    @order = order
    mail to: @order.email, subject: 'Your Order with jungle.com'
  end
end
