class Recipe
  attr_reader :id, :name, :description, :ingredients

  def initialize(id, name, description, ingredients)
    @id = id
    @name = name
    @description = description
    @ingredients = ingredients
  end
end
