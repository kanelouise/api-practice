# This file should contain all the record creation needed to  the database with its default values.
# The data can then be loaded with the bin/rails db: command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

CSV.foreach(Rails.root.join('lib/product_seeds.csv'), headers: true) do |row|
  
    Product.create({
      id: row[0],
      name: row[1],
      brand: row[2],
      price: row[3],
      description: row[4]
    })end