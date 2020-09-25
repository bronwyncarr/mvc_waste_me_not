class Recipe
  def initialize(id, name, description, ingredients)
    @id = id
    @name = name
    @description = description
    @ingredients = ingredients
  end


end

puts Recipe.new("id", "name", "description", "ingredients")
