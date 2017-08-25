class ItemMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.item_mailer.confirmation.subject
  #


  def confirmation(item)
    @user = item.owner  # Instance variable => available in view
    @item = item

    mail(to: @user.email, subject: "This is to comfirm that #{@item.item_name} has been created")
    # This will render a view in `app/views/user_mailer`!
  end
end
