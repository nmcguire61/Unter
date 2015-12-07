# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u1 = User.create!( name: "admin", email:"admin@unter.com", password: "password", role: "admin")
u2 = User.create!( name: "user", email:"user@unter.com", password: "password", role: "user")
