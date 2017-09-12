class AddOrderToPurchases < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :order, :string
  end
end
