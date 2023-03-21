FactoryBot.define do
  factory :item do
    association :user

    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    preparation_day_id { Faker::Number.between(from: 1, to: 3) }
    category_id { Faker::Number.between(from: 1, to: 10) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    item_condition_id { Faker::Number.between(from: 1, to: 6) }
    postage_payer_id { Faker::Number.between(from: 1, to: 2) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    after(:build) do |item|
    end
  end
end