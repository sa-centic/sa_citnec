# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Role.create_or_find_by!(name: 'admin')
Role.create_or_find_by!(name: 'moderator')
Role.create_or_find_by!(name: 'courseholder')
Role.create_or_find_by!(name: 'coursetaker')

User.create_or_find_by!(email: 'admin@admin.com', password: '123456', first_name: 'Admin', last_name: 'Admin', role_ids: '1')
User.create_or_find_by!(email: 'mod@mod.com', password: '123456', first_name: 'Moderator', last_name: 'Moderator', role_ids: '2')
User.create_or_find_by!(email: 'coursetaker@coursetaker.com', password: '123456', first_name: 'Coursetaker', last_name: 'Coursetaker', role_ids: '3')