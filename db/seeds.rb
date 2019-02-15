require "open-uri"
require "json"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

serialized = open(url).read
ingredients = JSON.parse(serialized)
puts "creating ingredients"
ingredients["drinks"].each do |drink|
  Ingredient.create(name:drink["strIngredient1"])
end
puts "done"
