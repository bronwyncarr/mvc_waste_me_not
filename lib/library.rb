require 'json'

class Library
  attr_accessor :recipes
  
  def initialize
    returned_data = File.read("../public/data.json")
    @recipes = JSON.parse(returned_data)
  end


  def create_recipes
    new_recipe = Recipe.new
    @recipes << new_recipe.make_new_recipe
  end

  def read_recipes
    if @recipes == []
      puts 'No recipes to display'
    else
      table = TTY::Table.new(%i[Name Desciption Ingredients], @recipes)
      puts table.render(:ascii, alignment: [:center], resize: true)
    end
  end

  def search_recipes
    list = []
    puts "\nWhat would you like to test?"
    ing = gets.chomp
    @recipes.each do |item|
    list << item[0] if item[2].include?(ing)
    end
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
