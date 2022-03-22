# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Make Admin role
Role.create_or_find_by!(name: 'admin')
#Make moderator/Bookkeeper role
Role.create_or_find_by!(name: 'moderator')
#Make courseholder role
Role.create_or_find_by!(name: 'courseholder')
#Make coursetaker role
Role.create_or_find_by!(name: 'coursetaker')


# Seed database with an admin and Mod/bookkeeper
User.create_or_find_by!(email: 'psn@admin.com', password: '1234FemSeks', first_name: 'Per', last_name: 'Hansen', role_ids: '1')
User.create_or_find_by!(email: 'bm@mod.com', password: '1234FemSeks', first_name: 'Birthe Damgaard', last_name: 'Madsen', role_ids: '2')

# Seed database with 4 courseholders
User.create_or_find_by!(email: 'wa@BodyCombat.com', password: '1234FemSeks', first_name: 'Winnie', last_name: 'Andersen', role_ids: '3')
User.create_or_find_by!(email: 'pg@Boulders.com', password: '1234FemSeks', first_name: 'Peter', last_name: 'Gottlieb', role_ids: '3')
User.create_or_find_by!(email: 'lm@PushPull.com', password: '1234FemSeks', first_name: 'Lasse', last_name: 'Mertz', role_ids: '3')
User.create_or_find_by!(email: 'oa@BikingInYourLivingRoom.com', password: '1234FemSeks', first_name: 'Ognjen', last_name: 'Andric', role_ids: '3')

# Seed database with 1 coursetaker
User.create_or_find_by!(email: 'kursist@kursist.dk', password: '1234FemSeks', first_name: 'Random', last_name: 'Kursist', role_ids: '4', courseholder_id: '3')