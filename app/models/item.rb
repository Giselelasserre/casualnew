class Item < ApplicationRecord
  CATEGORIES= ["Blouse", "Shirt", "Accessories", "Pant", "Jacket", "Other"]
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  has_many :purchases, dependent: :destroy
  has_many :customers, through: :purchases, class_name:"User", source: "user"
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def suggestions
     return Item.where.not(category: self.category).sample(3)
   end

end
