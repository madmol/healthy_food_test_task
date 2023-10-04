FactoryBot.define do
  factory :dish do
    name { Faker::Food.dish + SecureRandom.hex(2) }
  end
end
