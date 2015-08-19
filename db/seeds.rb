# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create({ name: "Admin" })
Role.create({ name: "Hr" })
Role.create({ name: "ProjectManager" })
Role.create({ name: "Employee" })





# User.create(email: 'test@example.com', password: '123456789', full_name: 'User1', :role '1', address: 'LA', phone: '0123456789', skype: 'test2')