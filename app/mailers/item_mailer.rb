class ItemMailer < ApplicationMailer
  def confirmation(item)
    @user = item.owner  # Instance variable => available in view
    @item = item

    mail(to: @user.email, subject: "This is to comfirm that #{@item.item_name} has been created")
    # This will render a view in `app/views/user_mailer`!
  end

  def sold(purchase)
    @user = purchase.item.owner  # Instance variable => available in view
    @purchase = purchase

    mail(to: @user.email, subject: "You just sold #{@purchase.item.item_name}, congrats!")
    # This will render a view in `app/views/user_mailer`!
  end
end
