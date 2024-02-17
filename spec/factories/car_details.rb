require 'faker'

FactoryBot.define do
  factory :car_detail do
    car
    engine_type
    horsepower { Faker::Number.between(from: 100, to: 600) }
    torque { Faker::Number.between(from: 100, to: 600) }
    fuel_economy { Faker::Number.decimal(l_digits: 2, r_digits: 1) }
    range { Faker::Number.between(from: 200, to: 500).to_s }
    seating_capacity { Faker::Number.between(from: 2, to: 5) }
    cargo_space { Faker::Number.between(from: 10, to: 50).to_s }
    infotainment_system { Faker::Vehicle.standard_specs.sample }
    safety_rating { Faker::Vehicle.standard_specs.sample }
    tech_features { Faker::Vehicle.standard_specs.sample }
    special_features { Faker::Vehicle.standard_specs.sample }
  end
end
