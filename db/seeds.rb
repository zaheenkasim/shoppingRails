# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Product.create([
    { name: 'Product 1', description: 'Description of product 1', price: 19.99 },
    { name: 'Product 2', description: 'Description of product 2', price: 29.99 },
    { name: 'Product 3', description: 'Description of product 3', price: 39.99 }
  ])