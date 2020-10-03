# This class handles the CRUD logic of interacting with the json database.
# It includes a create, read, save and delete method.
# Presentation logic was intentionally kept seperate.

require 'json'

class Library
  attr_reader :recipes

  include Constants

  def initialize
    @recipes = JSON.parse(File.read(RECIPE_DATABASE))
  end

  def save_recipes
    File.write(RECIPE_DATABASE, @recipes)
  end

  def create_recipes(new_recipe)
    @recipes << new_recipe
    save_recipes
  end

  def read_recipes
    formatted_rec = @recipes.map do |item|
      ing = item[2].join(", ")
      [item[0], item[1], ing]
    end
    table = TTY::Table.new(TABLE_HEADING, formatted_rec)
    table.render(:ascii, alignment: [:center], resize: true)
  end

  def delete_recipes(to_be_deleted)
    @was_it_there = false
    @recipes.each do |item|
      next unless to_be_deleted == item[0]

      @was_it_there = true
      @recipes.delete(item)
      save_recipes
      break
    end
    @was_it_there
  end
end
