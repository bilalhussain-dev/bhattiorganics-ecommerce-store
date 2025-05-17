# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Clear existing data
Category.destroy_all
puts "Cleared existing categories"

# Create animal categories
animals = ['Horse', 'Goat', 'Dog']
animals.each do |animal|
  Category.create!(name: animal, category_type: 'animal')
  puts "Created animal category: #{animal}"
end

# Create bird categories
birds = ['Pigeon', 'Eagle', 'Hen', 'Duck']
birds.each do |bird|
  Category.create!(name: bird, category_type: 'bird')
  puts "Created bird category: #{bird}"
end

puts "Seed completed successfully! Created #{Category.count} categories."