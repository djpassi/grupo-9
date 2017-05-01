# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'sStar Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 
# (1..50).each do |i|
#   User.create(first_name:Faker::Name.first_name, last_name: Faker::Name.last_name ,email:Faker::Internet.unique.email ,sex:'M',password:Faker::Internet.password(8),image:Faker::Internet.url,description:Faker::Lorem.sentence(3),role:'User')
#   Comment.create(user_id:Faker::Number.between(1, 50), project_id:Faker::Number.between(1, 50), content:Faker::HarryPotter.quote)
#   Project.create(name:Faker::Company.name, description:Faker::Lorem.sentence(3), image:Faker::Internet.url, goal:Faker::Number.between(1000, 1000000), user_id:Faker::Number.between(1, 50))
#   Investment.create(user_id:Faker::Number.between(1, 50), project_id:Faker::Number.between(1, 50), amount: Faker::Number.between(1, 200))

end
