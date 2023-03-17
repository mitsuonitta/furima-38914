FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    family_name {"佐藤"}
    first_name {"太郎"}
    family_name_kana {"サトウ"}
    first_name_kana {"タロウ"}
    birth_date {Faker::Date.birthday(min_age: 0, max_age:100)}
  end
end