FactoryBot.define do
  factory :item do
    association :user

    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    preparation_day_id { Faker::Number.between(from: 2, to: 4) }
    category_id { Faker::Number.between(from: 2, to: 11) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    item_condition_id { Faker::Number.between(from: 2, to: 7) }
    postage_payer_id { Faker::Number.between(from: 2, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end