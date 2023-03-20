class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_one_attached :image
  has_one :orders
  #validates :content, presence: true, unless: :was_attached?

  with_options presence: true do
  validates :name
  validates :price,numericality:{ only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :description
  validates :preparation_day_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :user
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :item_condition_id, numericality: { other_than: 1 }
  validates :postage_payer_id, numericality: { other_than: 1 }
  end

  def was_attached?
    self.image.attached?
  end
end
