class OrderAddresse
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_numher, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    #validates :building_name
    validates :phone_numher, format: { with: /\A\d{10,11}\z/}
    validates :token
  end

   def save
     order = Order.create(user_id: user_id, item_id: item_id)
     Addresse.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_numher: phone_numher)
   end
end
