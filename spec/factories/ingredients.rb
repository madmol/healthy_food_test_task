FactoryBot.define do
  factory :ingredient do
    name { Faker::Food.ingredient + SecureRandom.hex(2) }
  end
end
