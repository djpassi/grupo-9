# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Category.destroy_all

User.create(first_name:'Diego', last_name:'Passi',email:'djpassi@uc.cl',sex:'M',password:'12345',image:'fb.com',description:'CEO Dislike',role:'User')
User.create(first_name:'David', last_name:'Galemiri',email:'dagalemiri@uc.cl',sex:'F',password:'12345',image:'google.com',description:'CTO Dislike',role:'User')

Category.create(name:'Sports', description:'Deportes',image:'sdf')
Category.create(name:'Food', description:'Deportes',image:'sdf')
Category.create(name:'Education', description:'Deportes',image:'sdf')
