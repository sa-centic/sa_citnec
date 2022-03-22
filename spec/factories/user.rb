FactoryBot.define do
  factory(:user) do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { "123456" }

    trait :admin do
      after(:create) {|user| user.add_role(:admin)}
    end

    trait :moderator do
      after(:create) {|user| user.add_role(:moderator)}
    end
    trait :courseholder do
      after(:create) {|user| user.add_role(:courseholder)}
    end
    trait :coursetaker do
      after(:create) {|user| user.add_role(:coursetaker)}
    end
  end

end