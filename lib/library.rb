require 'json'

class Library
  attr_accessor :recipes

  include Constants

  def initialize
    @recipes = JSON.parse(File.read(RECIPE_DATABASE))
  end

  def save_recipes
    File.write(RECIPE_DATABASE, @recipes)
  end

  def create_recipes(name, description, ingredients)
    new_recipe = [name, description, ingredients]
    @recipes << new_recipe

  end

  def read_recipes
      table = TTY::Table.new(TABLE_HEADING, @recipes)
      table.render(:ascii, alignment: [:center], resize: true)
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
