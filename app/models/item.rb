class Item < ApplicationRecord
  belongs_to :menu
  validates :image, presence: true

  has_many :order_items
  has_many :orders, through: :order_items
end
