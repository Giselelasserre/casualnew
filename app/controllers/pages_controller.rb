class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def showsuggestion
    if Item.where(category: "Pant")
     render @item_photo_item.where.category.not(id: self.id)

   elsif Item.where(category: "Shirt")
     render @item_photo_item.where.category.not(id: self.id)

   elsif Item.where(category: "Jacket")
     render @item_photo_item.where.category.not(id: self.id)

   else Item.where(category: "Accessories")

     render @item_photo_item.where.category.not(id: self.id)

   end

 end

end
