# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "json"

puts "Cleaning db..."
Ingredient.destroy_all

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
serialized_cocktails = open(url).read
cocktails = JSON.parse(serialized_cocktails)

cocktails['drinks'].each do |cocktail|
  Ingredient.create(name: cocktail['strIngredient1'])
end

Cocktail.create(name: 'Bloody Mary')
Cocktail.create(name: 'Gin Tonic')
Cocktail.create(name: 'Moscow Mule')
Cocktail.create(name: 'Campari Orange')
Cocktail.create(name: 'Hugo')
