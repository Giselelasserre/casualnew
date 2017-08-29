class PurchasesController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    purchase = Purchase.create!(item: item, amount: item.price, user: current_user, status: 'pending')

    redirect_to new_purchase_payment_path(purchase)
  end

  def show
    @purchase = Purchase.find(params[:id])
  end
end


