# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# creation of 100 user with a name and a photo

# first unsplash collection of portrait : https://unsplash.com/collections/4281671/minimal-portrait
# first unsplash collection of portrait : https://unsplash.com/collections/1346789/portrait-reference
# unsplash url to request https://source.unsplash.com/collection/${collection_id}/1600x900

100.times do |i|
  collection_id = i < 50 ? "4281671" : "1346789"
  unsplash_url = "https://source.unsplash.com/collection/#{collection_id}/1600x900"

end