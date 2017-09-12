class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to Casual, clothes and accessories to buy and sell')
    # This will render a view in `app/views/user_mailer`!
  end

  def contactus(user, message)
    @user = user
    @message = message
    mail(to: 'casuallewagon@gmail.com', subject: "This is a message from #{user.first_name} #{user.last_name} at #{user.email}")
  end

end
