# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
# FlightInformation.create!({name: "Indigo", source: "Mumbai", destination: "Delhi", source_code: "BOM", destination_code: "DEL", amount: "5000.0", two_way: true, refundable: true, journey_date: Date.today + 20, journey_time: Time.now, travel_time: 2.0})
# Company.create(name: "ABC")