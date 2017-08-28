class PaymentsController < ApplicationController
  before_action :set_order

def new

  redirect_to item_purchase_payments

end

def create
   user = Stripe::User.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     user.id,   # You should store this customer id and re-use it.
    amount:       @purchase.amount_cents, # or amount_pennies
    description:  "Payment for Casual #{@purchase.item_name} for order #{@purchase.id}",
    currency:     @purchase.amount.currency
  )

  @purchase.update(payment: charge.to_json, state: 'paid')
  redirect_to purchase_path(@purchase)

rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_item_purchase_payment(@purchase)




end

private

  def set_pruchase
    @purchase = Purchase.where(state: 'pending').find(params[:purchase_id])
  end

end
