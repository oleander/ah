# frozen_string_literal: true

FactoryBot.define do
  factory :material do
    sequence(:name) { |n| Faker::Construction.material + n.to_s }
  end

  factory :request do
    phone_number { Faker::PhoneNumber.phone_number }
    area { Faker::Number.between(from: 0, to: 100) }
    materials { create_list(:material, 1) }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
  end

  factory :partner do
    operating_radius { Faker::Number.between(from: 0, to: 100) }
    rating { Faker::Number.between(from: 0, to: 5) }
    materials { create_list(:material, 2) }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
  end

  factory :requirement do
    request
    material
  end

  factory :experience do
    partner
    material
  end
end
