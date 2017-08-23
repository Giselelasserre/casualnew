class PurchasesController < ApplicationController
def create
    @purchase = Purchase.new(purchase_params)
    @item = Item.find(params[:item_id])
    @purchase.item = @item
    @purchase.user = current_user

    if @purchase.save
      redirect_to item_path(@item), notice: "Purchase is Done!"
    else
      flash.now[:alert] = @purchase.errors.full_messages.join(', ')
      render "items/show"
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:item, :date)
  end
end
