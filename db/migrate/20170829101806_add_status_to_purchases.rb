class AddStatusToPurchases < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :status, :string
  end
end
