require 'json'

class Library
  attr_accessor :recipes

  include Constants

  def initialize
    returned_data = File.read(RECIPE_DATABASE)
    @recipes = JSON.parse(returned_data)
  end

  def save_recipes
    File.write(RECIPE_DATABASE, @recipes)
  end

  def create_recipes
    new_recipe = Recipe.new
    @recipes << new_recipe.make_new_recipe
  end

  def read_recipes
    if @recipes == []
      puts 'No recipes to display'
    else
      table = TTY::Table.new(TABLE_HEADING, @recipes)
      puts table.render(:ascii, alignment: [:center], resize: true)
    end
  end

  def delete_recipes
    puts 'These are your recipes.'
    read_recipes
    puts "What's the title of the one you would like to delete?"
    to_be_deleted = gets.strip
    @recipes.each do |item|
      if to_be_deleted == item[0]
        @recipes.delete(item)
        break
      end
    end
    save_recipes
  end
end
