# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Match.destroy_all


anna = User.create(name: "Anna Love", email: "anna@test.com", password: "12345")
bob = User.create(name: "Robert Porter", email: "bob@test.com", password: "12345")
alex = User.create(name: "Alex Ham", email: "alex@test.com", password: "12345")

match1 = Match.create(date: Date.new, place: "Central Park", matcher: anna, matchee: bob)
match2 = Match.create(date: Date.new, place: "MET", matcher: anna, matchee: alex)
match2 = Match.create(date: Date.new, place: "Opera", matcher: alex, matchee: anna)
