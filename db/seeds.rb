# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Cars.delete_all
Journey.delete_all
Passengers.delete_all
Drivers.delete_all


u1 = User.create!( name: "adminAdam", email:"admin@unter.com", password: "password", role: "admin", rating_avg: 12345, description: "I love to play 'adminton!")
u2 = User.create!( name: "userEwan", email: "user@unter.com", password: "password", role: "user", rating_avg: 12345, description: "Hey guys, I like to travel a lot, lets save monies on gas price. Whoo! (Neil)")
u3 = User.create!( name: "Babs", email: "battleaxebetty@internets.example", password: "password", role: "user", rating_avg: 12345, description: "Scream if you want to go faster!")
u4 = User.create!( name: "Gerald", email: "gerrygerrysweetcaroline@internets.example", password: "password", role: "user", rating_avg: 12345, description: "Show me the money!")
u5 = User.create!( name: "Harold", email: "harollingthunder@internets.example", password: "password", role: "user", rating_avg: 12345, description: "They see me rollin. They hatin. Is it cos I'm white and nerdy.")
u6 = User.create!( name: "Margret", email: "magstheminx@internets.example", password: "password", role: "user", rating_avg: 12345, description: "Just call me mustang mags!")

c1 = Car.create!( brand:"VW", seats:"4", user_id:u2.id)
c2 = Car.create!( brand:"ford", seats:"4",
  user_id:u6.id)
c3 = Car.create!( brand: "lamborghini", seats:"1", user_id:u5.id)

j5 = Journey.create!(starting_point:"Edinburgh", ending_point: "London", starting_time:"2015-12-11 16:51:00", user_id: u6.id, status:"open")
j4 = Journey.create!(starting_point:"Cardiff", ending_point: "York", starting_time:"2015-12-11 09:54:00", user_id: u2.id, status:"open")
j3 = Journey.create!(starting_point:"Edinburgh", ending_point: "Dundee", starting_time:"2015-12-12 20:59:00", user_id: u5.id, status:"open")
j2 = Journey.create!(starting_point:"York", ending_point: "Edinburgh", starting_time:"2015-12-08 17:03:00", user_id: u5.id, status:"finished", created_at: "2015-12-07 17:04:14", updated_at: "2015-12-07 22:04:14")
j1 = Journey.create!(starting_point:"London", ending_point: "York", starting_time:"2015-12-03 10:13:00" , user_id: u5.id, status:"finished", created_at: "2015-12-01 17:13:49", updated_at: "2015-12-03 17:13:49")

p1 = Passenger.create!(id: 1, user_id: u3.id, journey_id: j1.id, status: "Accepted", price: 20.0, created_at: "2015-12-09 17:08:21", updated_at: "2015-12-09 17:10:44")

p2 = Passenger.create!(id:2, user_id: u3.id, journey_id: j2.id, status: "Accepted", price: 25.0, created_at: "2015-12-07 22:14:30", updated_at: "2015-12-07 22:34:43")

p3 = Passenger.create!(id:3, user_id: u4.id, journey_id: j2.id, status: "Rejected", price: 10.0, created_at: "2015-12-09 21:10:58", updated_at: "2015-12-07 22:32:43")

d1 = Driver.create!(id:1, user_id:u5.id, journey_id:j1.id, status: nil, price: nil)
d2 = Driver.create!(id:2, user_id:u5.id, journey_id:j2.id, status: nil, price: nil)
d3 = Driver.create!(id:3, user_id:u5.id, journey_id:j3.id, status: nil, price: nil)
d4 = Driver.create!(id:4, user_id:u6.id, journey_id:j4.id, status: nil, price: nil)
d5 = Driver.create!(id:5, user_id:u6.id, journey_id:j5.id, status: nil, price: nil)