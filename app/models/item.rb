class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :condition, :burden, :prefecture, :delivery_time

  has_one_attached :image

  validates :category_id, :condition_id, :burden_id, :prefecture_id, :delivery_time_id, numericality: { other_than: 1 }
end
