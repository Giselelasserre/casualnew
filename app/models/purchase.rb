class Purchase < ApplicationRecord
  STATUS= ["sold", "pending", "declined"]
  validates :status, presence: true, inclusion: { in: STATUS }

  belongs_to :item
  belongs_to :user
  validates :item, presence: true
  validates :user, presence: true

  after_create :change_status_item
  after_create :set_order

  monetize :amount_cents

  def change_status_item
    self.item.update(available: false)
  end

  private
  def set_order
    self.update(order: Time.now.to_i.to_s + id.to_s)
  end

end
