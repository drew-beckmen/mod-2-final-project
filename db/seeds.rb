# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'bcrypt'
require 'date'

User.destroy_all 
Activity.destroy_all 
ActivityType.destroy_all
Membership.destroy_all 
Group.destroy_all 
Goal.destroy_all 

# Password for seed data users is "password"

at1 = ActivityType.create(name: "Board Game")
at2 = ActivityType.create(name: "Draw")
at3 = ActivityType.create(name: "Running")
at4 = ActivityType.create(name: "Exercise")
at5 = ActivityType.create(name: "Yoga")

u1 = User.create(name: "Sylwia", username: "SYLWIA", contact: "sylwia@gmail.com", photo: "https://api.time.com/wp-content/uploads/2019/08/better-smartphone-photos.jpg", password_digest: BCrypt::Password.create("password"))
u2 = User.create(name: "Alex", username: "ALEX", contact: "alex@gmail.com", photo: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", password_digest: BCrypt::Password.create("password"))
u3 = User.create(name: "Vidhi", username: "VIDHI", contact: "vidhi@gmail.com", photo: "https://st3.depositphotos.com/1000816/18636/i/450/depositphotos_186364412-stock-photo-happy-business-woman-smiling-isolated.jpg", password_digest: BCrypt::Password.create("password"))

g1 = Goal.create(target_hours: 5, user: u1, name: "Lose Weight", description: "Big Challenge", start_day: Date.today, end_day: Date.new(2021, 9, 20), status: "Incomplete")
g2 = Goal.create(target_hours: 5, user: u2, name: "New Year", description: "Lose Weight Challenge", start_day: Date.today, end_day: Date.new(2021, 5, 23), status: "Incomplete")
g3 = Goal.create(target_hours: 8, user: u3, name: "Learn Something", description: "Read Books", start_day: Date.today, end_day: Date.new(2021, 2, 28), status: "Incomplete")

a1 = Activity.create(activity_date: Date.yesterday, duration: 2, activity_type: at1, goal: g3, description: "Catan", rating: 4)
a2 = Activity.create(activity_date: Date.today, duration: 3, activity_type: at2, goal: g3, description: "sketching", rating: 2)
a3 = Activity.create(activity_date: Date.yesterday, duration: 0.5, activity_type: at3, goal: g1, description: "YMCA Workout", rating: 1)
a4 = Activity.create(activity_date: Date.today, duration: 1, activity_type: at5, goal: g2, description: "Fancy Yoga Class", rating: 2)

group1 = Group.create(name: "Yogies", creator_id: u2.id)
group2 = Group.create(name: "Artists", creator_id: u3.id)

member1 = Membership.create(group: group1, user: u2)
member2 = Membership.create(group: group2, user: u3)






