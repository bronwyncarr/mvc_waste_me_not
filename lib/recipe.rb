class Recipe
  attr_reader :id, :name, :description, :ingredients

  def initialize(id, name, description, ingredients)
    @id = id
    @name = name
    @description = description
    @ingredients = ingredients
  end

  def self.get_new_recipe
    p 'hello'
  end
end
