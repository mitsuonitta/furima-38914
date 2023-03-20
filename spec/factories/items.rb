FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    price {Faker::Date.price(min_age: 300, max_age:9999999)}
    description { '1a' + Faker::Internet.password(min_length: 6) }
    preparation_day_id {password}
    category_id 
    prefecture_id 
    item_condition_id 
    postage_payer_id 
  end
end
