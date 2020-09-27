require 'json'
require_relative 'recipe'

class Library
  attr_accessor :recipes
  
  def initialize
    @recipes = []
  end

  def create_recipes
    new_recipe = Recipe.new
    new_new = new_recipe.make_new_recipe
    new_new.unshift(@recipes.length + 1)
    @recipes << new_new
  end

  def read_recipes
    if @recipes == []
      puts 'No recipes to display'
    else
      table = TTY::Table.new(%i[Id Name Desciption Ingredients], @recipes)
      puts table.render(:ascii, alignment: [:center], resize: true)
    end
  end

  def search_recipes
    list = []
    puts "\nWhat would you like to test?"
    ing = gets.chomp
    @recipes.each do |item|
      puts "#{item} first"
    list << item[1] if item[3].include?(ing)
    end
    puts "#{list} second"
    puts "Great news! #{ing.capitalize} appears in #{list.join(', ')}"
  end
end
















# # read

# returned_data = File.read('data.json')
# data = JSON.parse(returned_data)

# # write

# new_array = ["afsd", "fsad", ["fsad", "dfas"]]
# data << new_array

# # use either
# File.write("data.json", data.to_json) # or
# File.write("data.json", JSON.pretty_generate(data)) # prints prety
