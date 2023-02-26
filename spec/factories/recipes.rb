# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    title { Faker::Food.dish }
    cook_time { Faker::Number.number(digits: 2) }
    prep_time { Faker::Number.number(digits: 2) }
    ingredients { Array.new(rand(3..20)) { Faker::Food.ingredient } }
    ratings { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
    category { Faker::Food.ethnic_category }
    author { Faker::Games::Dota.hero }
    image { Faker::Avatar.image }
  end
end
