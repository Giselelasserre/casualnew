class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.owner.email, subject: 'You product <%= @item.item_name> sold')
    # This will render a view in `app/views/user_mailer`!
  end

end
