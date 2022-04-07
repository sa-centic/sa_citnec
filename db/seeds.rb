# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# Seed database with an admin and Mod/bookkeeper
Users::Admin.create_or_find_by!(first_name: 'Per', last_name: 'Hansen', email: 'psn@admin.com', password: '1234FemSeks', type: 'Users::Admin')
Users::Moderator.create_or_find_by!(first_name: 'Birthe', last_name: 'Madsen', email: 'bm@mod.com', password: '1234FemSeks', type: 'Users::Moderator')

# Seed database with 4 courseholders
Users::Courseholder.create_or_find_by!(first_name: 'Peter', last_name: 'Gottlieb', email: 'pg@boulders.com', password: '1234FemSeks', type: 'Users::Courseholder')
# Seed database with other random courseholders
Users::Courseholder.create_or_find_by!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '1234FemSeks', type: 'Users::Courseholder')
Users::Courseholder.create_or_find_by!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '1234FemSeks', type: 'Users::Courseholder')
Users::Courseholder.create_or_find_by!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '1234FemSeks', type: 'Users::Courseholder')
Users::Courseholder.create_or_find_by!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '1234FemSeks', type: 'Users::Courseholder')


# Seed database with a test coursetaker
Users::Coursetaker.create_or_find_by!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: 'kursist@centic.dk', password: '1234FemSeks', type: 'Users::Coursetaker')
# Seed with 9 other random coursetakers
Users::Coursetaker.create_or_find_by!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '1234FemSeks', type: 'Users::Coursetaker')
Users::Coursetaker.create_or_find_by!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '1234FemSeks', type: 'Users::Coursetaker')
Users::Coursetaker.create_or_find_by!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '1234FemSeks', type: 'Users::Coursetaker')
Users::Coursetaker.create_or_find_by!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '1234FemSeks', type: 'Users::Coursetaker')
Users::Coursetaker.create_or_find_by!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '1234FemSeks', type: 'Users::Coursetaker')
Users::Coursetaker.create_or_find_by!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '1234FemSeks', type: 'Users::Coursetaker')
Users::Coursetaker.create_or_find_by!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '1234FemSeks', type: 'Users::Coursetaker')
Users::Coursetaker.create_or_find_by!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '1234FemSeks', type: 'Users::Coursetaker')
Users::Coursetaker.create_or_find_by!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '1234FemSeks', type: 'Users::Coursetaker')


Course.create_or_find_by!(course_name: Faker::Hobby.activity, course_description:  Faker::Lorem.paragraph , max_coursetakers: Faker::Number.between(from: 1, to: 20))
Course.create_or_find_by!(course_name: Faker::Hobby.activity, course_description:  Faker::Lorem.paragraph , max_coursetakers: Faker::Number.between(from: 1, to: 20))
Course.create_or_find_by!(course_name: Faker::Hobby.activity, course_description:  Faker::Lorem.paragraph , max_coursetakers: Faker::Number.between(from: 1, to: 20))
Course.create_or_find_by!(course_name: Faker::Hobby.activity, course_description:  Faker::Lorem.paragraph , max_coursetakers: Faker::Number.between(from: 1, to: 20))
Course.create_or_find_by!(course_name: Faker::Hobby.activity, course_description:  Faker::Lorem.paragraph , max_coursetakers: Faker::Number.between(from: 1, to: 20))