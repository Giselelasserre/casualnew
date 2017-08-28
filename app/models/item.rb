class Item < ApplicationRecord
  CATEGORIES= ["Blouse", "Shirt", "Accessories", "Pant", "Jacket", "Other"]
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  has_many :purchases, dependent: :destroy
  has_many :customers, through: :purchases, class_name:"User", source: "user"
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  after_create :send_confirmation_email

  has_attachments :photo_items, maximum: 10
  monetize :price_cents

  def self.available
    where(available: true)
  end

  def suggestions
    return Item.available.where.not(category: self.category).sample(3)
  end

  private

  def send_confirmation_email
    ItemMailer.confirmation(self).deliver_now
  end

end
