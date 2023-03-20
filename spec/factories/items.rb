FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    price {Faker::Date.price(min_age: 300, max_age:9999999)}
    description 
    preparation_day_id
    category_id 
    prefecture_id 
    item_condition_id 
    postage_payer_id 
    association :user 
  end
end
