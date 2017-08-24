class RemovePhotoFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :photo_item, :string
  end
end
