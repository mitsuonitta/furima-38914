FactoryBot.define do
  factory :item do
    name  { 'パソコン' }
    price {Faker::Date.price(min_age: 300, max_age:9999999)}
    description { '3年前に購入したMacBookです' }
    preparation_day_id { 2 }
    category_id { 2 }
    prefecture_id { 2 }
    item_condition_id { 2 }
    postage_payer_id { 2 }

     association :user 
     after(:build) do |item|
       item.image.attach(io: File.open('public/images/sample.jpeg'), filename: 'sample.jpeg')
     end
  end
end
