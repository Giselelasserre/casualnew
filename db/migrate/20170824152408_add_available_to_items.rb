class AddAvailableToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :available, :boolean, default: true
  end
end
