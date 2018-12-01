# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Match.destroy_all


anna = User.create(name: "Anna Love", email: "anna@test.com", password: "123456")
bob = User.create(name: "Robert Porter", email: "bob@test.com", password: "123456")
alex = User.create(name: "Alex Ham", email: "alex@test.com", password: "123456")

quiz1 = Quiz.create(user: anna, score: 60, q1: 1, q2: 2, q3: 1, q4: 1, q5: 1)
quiz2 = Quiz.create(user: alex, score: 70, q1: 1, q2: 2, q3: 1, q4: 1, q5: 2)
quiz3 = Quiz.create(user: bob, score: 50, q1: 1, q2: 1, q3: 1, q4: 1, q5: 1)

match1 = Match.create(matcher: anna, matchee: bob)
match2 = Match.create(matcher: anna, matchee: alex, compatibility: 4)
match2 = Match.create(matcher: alex, matchee: anna, compatibility: 4)
