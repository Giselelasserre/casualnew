class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :purchases
  has_many :purchased_item, through: :purchases, class_name: "Item", source: "item"
  has_many :items, dependent: :destroy
  # belongs_to :owner, class_name: "User"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
