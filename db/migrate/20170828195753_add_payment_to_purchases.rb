class AddPaymentToPurchases < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :payment, :json
  end
end
