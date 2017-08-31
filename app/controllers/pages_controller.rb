class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @last_items = Item.last(3).reverse
  end

  def contact_us
    message = params[:message]
    UserMailer.contactus(current_user, message).deliver_now
    redirect_to :back
  end
end
