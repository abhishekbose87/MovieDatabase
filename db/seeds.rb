# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(name:"Abhishek",username:"example",email:"abc@xyz.com",password:"password")

c = Category.create(desc: "Horror")

Movie.create(title:"Dhoom2", description:"asdasd", cast: "asdasd", language:"asdasd", category_ids: c.id)

Movie.create!(title: "Rocky", description: "asdasdasd", cast: "asdasd", language: "English", category_ids: c.id)
