# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

CSV.foreach(Rails.root.join('lib/ItemDB_Sample.csv'), headers: true) do |row|
  category = Category.find_or_create_by(name: row[3])
  product_group = ProductGroup.find_or_create_by(name: row[4], category: category)
  Product.create(barcode: row[0],
                  itemno: row[1],
                  description: row[2],
                  price: row[5], product_group: product_group)
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
