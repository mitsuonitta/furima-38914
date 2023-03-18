class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_one_attached :image
  has_one :orders

  with_options presence: true do
  validates :name
  validates :price
  validates :description
  validates :preparation_day_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :user
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :item_condition_id, numericality: { other_than: 1 }
  validates :postage_payer_id, numericality: { other_than: 1 }
  end
end
