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
User.create_or_find_by!(email: 'courseholder1@courseholder.com', password: '123456', first_name: 'Courseholder1', last_name: 'Courseholder1', role_ids: '3')
User.create_or_find_by!(email: 'courseholder2@courseholder.com', password: '123456', first_name: 'Courseholder2', last_name: 'Courseholder2', role_ids: '3')
User.create_or_find_by!(email: 'courseholder3@courseholder.com', password: '123456', first_name: 'Courseholder3', last_name: 'Courseholder3', role_ids: '3')
User.create_or_find_by!(email: 'courseholder4@courseholder.com', password: '123456', first_name: 'Courseholder4', last_name: 'Courseholder4', role_ids: '3')