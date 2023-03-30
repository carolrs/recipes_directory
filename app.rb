# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, name, average_time, rating FROM recipes;'
result = DatabaseConnection.exec_params(sql, [])

recipes = RecipeRepository.new

puts "Recipes Book:"
puts " "
# Print out each record from the result set .
recipes.all.each do |record|
  puts "Recipe: #{record.name} - Average Time: #{record.average_time} min - Rate: #{record.rating} stars"

end

