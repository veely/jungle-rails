class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def email_receipt(order)
    @order = order
    @url  = 'localhost:3000/orders/:id'
    mail(to: 'dummy@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
