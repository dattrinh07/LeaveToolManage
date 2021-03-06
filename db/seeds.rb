# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create( name: "Admin" )
Role.create( name: "Hr" )
Role.create( name: "PM" )
Role.create( name: "Employee" )

Admin = User.create(email: 'admin@asiantech.vn', password: '', full_name: 'Admin', address: 'DN', phone: '0988888', skype: '12345')
u1 = User.create(email: 'user1@asiantech.vn', password: '', full_name: 'User1', address: 'DN', phone: '0988888', skype: '12345')
u2 = User.create(email: 'user2@asiantech.vn', password: '', full_name: 'User2', address: 'DN', phone: '0988888', skype: '12345')
u3 = User.create(email: 'user3@asiantech.vn', password: '', full_name: 'User3', address: 'DN', phone: '0988888', skype: '12345')


Admin.add_role :Admin
u1.add_role :Hr
u2.add_role :PM
u3.add_role :Employee	