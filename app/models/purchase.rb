class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :item, presence: true
  validates :user, presence: true

  after_create :change_status_item

  monetize :amount_cents

  def change_status_item
    self.item.update(available: false)
  end

end
