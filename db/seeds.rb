# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

puts "Destroying all records..."
Ingredient.destroy_all
Cocktail.destroy_all

puts "Creating new records..."
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = JSON.parse(open(url).read)
ingredients = json["drinks"]

ingredients.each do |hash|
  hash.each_value do |value|
    Ingredient.create(name: value)
  end
end

mart_file = URI.open('https://images.unsplash.com/photo-1575023782549-62ca0d244b39?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80')
marg_file = URI.open('https://images.unsplash.com/photo-1590701833281-e6283af0948d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80')
old_file = URI.open('https://images.unsplash.com/photo-1552299100-a3abff9291e5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80')

martini = Cocktail.create(name: "Martini")
martini.photo.attach(io: mart_file, filename: 'martini.png', content_type: 'image/png')

margarita = Cocktail.create(name: "Margarita")
margarita.photo.attach(io: marg_file, filename: 'margarita.png', content_type: 'image/png')

old_fashioned = Cocktail.create(name: "Old fashioned")
old_fashioned.photo.attach(io: old_file, filename: 'old_fashioned.png', content_type: 'image/png')

puts "New records complete"
