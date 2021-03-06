FactoryBot.define do

  factory :product do
    name              {"Dog"}
    description                 {"Dos is sleeping"}
    brand              {"Bow_wow"}
    condition_id   {"1"}
    delivery_cost_id {"1"}
    region_id {"1"}
    preparation_day_id {"1"}
    price {"500"}
    user_id {'1'}
    trait :with_nested_instance do
      after( :create ) do
        create :image
      end
    end

    association :user
  end

end