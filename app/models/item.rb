class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_time

  validates :category_id, :condition_id, :burden_id, :prefecture_id, :delivery_time_id, numericality: { other_than: 1 }
  validates :price, presence: true
  validates :product, presence: true
  validates :product_explain, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
