class PaymentsController < ApplicationController
  before_action :set_purchase

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @purchase.amount_cents, # or amount_pennies
      description:  "Payment for Casual #{@purchase.item.item_name} for order #{@purchase.id}",
      currency:     @purchase.amount.currency
    )

    @purchase.update(payment: charge.to_json)
    redirect_to purchase_path(@purchase)
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to payment_path
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:purchase_id])
    # @purchase = Purchase.where(state: 'pending').find(params[:purchase_id])

  end
end
