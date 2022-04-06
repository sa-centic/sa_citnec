FactoryBot.define do
  factory(:course) do
    course_name { Faker::Hobby.activity }
    course_description { Faker::Lorem.paragraph }
    max_coursetakers { Faker::Number.between(from: 1, to: 20)  }
    courseholder_id { nil }

  end
end