Area.create!([
  { name: "Hörnie", lat: 47.6636, lng: 9.1842, algae_index: 0.2 },
  { name: "Schenzer", lat: 47.6650, lng: 9.1700, algae_index: 0.8 },
  { name: "Herose", lat: 47.6600, lng: 9.1600, algae_index: 1.4 }
])


# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
