class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :content, length: { minimum: 20 }
end
