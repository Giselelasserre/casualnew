class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :size
      t.float :price
      t.string :photo_item
      t.string :item_name
      t.integer :days_delivery
      t.string :address
      t.text :description

      t.timestamps
    end
  end
end
