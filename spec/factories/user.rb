FactoryBot.define do
  factory(:user) do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { "1234FemSeks" }

    trait :admin do
      before(:create) {|user| user.add_role(:admin)}
    end

    trait :moderator do
      before(:create) {|user| user.add_role(:moderator)}
    end

    trait :courseholder do
      before(:create) {|user| user.add_role(:courseholder)}
    end

    trait :coursetaker do
      before(:create) {|user| user.add_role(:coursetaker)}
      before(:create) {|user| user.add_role(:coursetaker)}

    end

  end
end