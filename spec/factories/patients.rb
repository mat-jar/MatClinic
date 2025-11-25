Faker::Config.locale = :pl
FactoryBot.define do
  factory :patient do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    gender { Faker::Gender.binary_type.downcase }
    birth_date { Faker::Date.birthday(min_age: 1, max_age: 115)}
    pesel { Faker::Number.number(digits: 11) }
    city { Faker::Address.city }
  end
end
