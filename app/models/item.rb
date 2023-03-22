class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :preparation_day 
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to :user
  belongs_to :category
  has_one_attached :image
  #has_one :orders

  #with_options presence: true do
  validates :name, presence: true 
  validates :price,numericality:{ only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :description, presence: true 
  validates :preparation_day_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :item_condition_id, numericality: { other_than: 1 }
  validates :postage_payer_id, numericality: { other_than: 1 }
  #end

   def was_attached?
   self.image.attached?
  end
end
