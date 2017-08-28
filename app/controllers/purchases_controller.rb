class PurchasesController < ApplicationController
  def create
    # @purchase = Purchase.new(purchase_params)
    # @item = Item.find(params[:item_id])
    # @purchase.item = @item
    # @purchase.user = current_user

    # if @purchase.save
    #   # redirect_to item_path(@item), notice: "Purchase is Done!"
    #   redirect_to payment_path


    # else
    #   flash.now[:alert] = @purchase.errors.full_messages.join(', ')
    #   render "items/show"
    # end
    item = Item.find(params[:item_id])
    purchase = Purchase.create!(item: item, amount: item.price, user: current_user)

    redirect_to new_purchase_payment_path(purchase)
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  private

  def purchase_params
    params.require(:purchase).permit(:item, :date, :amount_cents, :payment )
  end
end


