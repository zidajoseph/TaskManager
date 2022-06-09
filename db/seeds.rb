# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:"example",email: "admin@example.com",password:"12345678",password_confirmation:"12345678",admin:true)

10.times do |n|
    Label.create!(name: Faker::Color.color_name)
    User.create!(
      name: Faker::Creature::Animal.name,
      email: Faker::Internet.email,
      password: "password"
                 )
end
  
  10.times do |n|
    Task.create!(
      name: "task#{n+1}",
      content: "detail#{n+1}",
      dead_line: DateTime.now,
      status: rand(1..3),
      priority: rand(1..3),
      user_id: rand(1..10)
                 )
  end

