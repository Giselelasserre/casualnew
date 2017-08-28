class AddAmountToPurchases < ActiveRecord::Migration[5.0]
  def change
    add_monetize :purchases, :amount, currency: { present: false }
  end
end
