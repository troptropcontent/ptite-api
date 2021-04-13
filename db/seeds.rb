# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"
# creation of 100 user with a name and a photo

# first unsplash collection of portrait : https://unsplash.com/collections/4281671/minimal-portrait
# first unsplash collection of portrait : https://unsplash.com/collections/1346789/portrait-reference
# unsplash url to request https://source.unsplash.com/collection/${collection_id}/1600x900

100.times do |i|
  collection_id = i < 50 ? "4281671" : "1346789"
  unsplash_url = "https://source.unsplash.com/collection/#{collection_id}/1600x900"
  photo = URI.open(unsplash_url)
  random_first_name = Faker::Name.first_name 
  random_last_name = Faker::Name.male_first_name
  username = random_first_name.downcase+random_last_name.downcase
  email = Faker::Internet.safe_email(name: username)
  password = "test1234"
  puts "Creation of a new User Instance for #{random_first_name} #{random_last_name}"
  user = User.create({
    last_name: random_last_name,
    first_name: random_first_name,
    password: password,
    email: email,
    username: username
  })
  puts "Adding the random portrait to the user..."
  user.photo.attach(io: photo, filename: "#{username}.png", content_type: 'image/png')
  puts "done."
  puts "New User Instance for #{random_first_name} #{random_last_name} succesfully created"

end