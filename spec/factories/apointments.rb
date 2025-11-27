Faker::Config.locale = :pl
FactoryBot.define do
  factory :appointment do
    date { Faker::Date.between(from: '2026-05-04', to: '2026-05-08')}
    time_slot { Faker::Number.between(from: 1, to: 23) }
    price { Faker::Number.between(from: 1, to: 10000) }
    patient {Patient.first || association(:patient)}
    doctor {Doctor.first || association(:doctor)}
  end
end
