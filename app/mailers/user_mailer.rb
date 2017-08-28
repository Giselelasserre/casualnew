class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to Casual, clothes and accessories to buy and sell')
    # This will render a view in `app/views/user_mailer`!
  end

end
