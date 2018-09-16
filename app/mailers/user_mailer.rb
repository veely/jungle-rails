class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def email_receipt(order, user)
    @user = user
    @order = order
    @url  = 'localhost:3000/orders/:id'
    mail(to: @user.email, subject: 'Jungle: Order #' + @order.id.to_s)
  end
end
