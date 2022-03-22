FactoryBot.define do
  factory :role do
    name { 'Test role' }

    trait :admin do
      name { 'admin' }
    end

    trait :moderator do
      name { 'moderator' }
    end

    trait :courseholder do
      name { 'courseholder' }
    end

    trait :coursetaker do
      name { 'coursetaker' }
    end
  end
end