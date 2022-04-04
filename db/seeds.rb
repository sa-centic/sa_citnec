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
admin = User.new(first_name: 'Per', last_name: 'Hansen', email: 'psn@admin.com', password: '1234FemSeks')
moderator = User.new(first_name: 'Birthe', last_name: 'Madsen', email: 'bm@mod.com', password: '1234FemSeks')

# Seed database with 4 courseholders
courseholder = Users::Courseholder.new(first_name: 'Peter', last_name: 'Gottlieb', email: 'pg@boulders.com', password: '1234FemSeks')
coursetaker = Users::Coursetaker.new(first_name: 'Attendant', last_name: 'Attendant', email: 'attendant@citnec.dk', password: '1234FemSeks')

admin.add_role(:admin)
moderator.add_role(:moderator)
courseholder.add_role(:courseholder)
coursetaker.add_role(:coursetaker)
admin.save
moderator.save
courseholder.save
coursetaker.save