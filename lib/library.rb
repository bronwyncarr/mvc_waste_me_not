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

  def delete_recipes(to_be_deleted)
    @was_it_there = false
    @recipes.each do |item|
      if to_be_deleted == item[0]
        @was_it_there = true
        @recipes.delete(item) 
        save_recipes
        break
      end
    end
    @was_it_there
  end
end
