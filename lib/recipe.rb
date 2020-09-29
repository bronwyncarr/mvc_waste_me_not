# class Recipe
#   def make_new_recipe
#     recipe = []
#     inputs = %i[Name Desciption Ingredients]
#     puts 'Create a new recipe'
#     puts 'Please enter the following information:'
#     inputs.each do |item|
#       if item == :Ingredients
#         puts "\nRecipe #{item}, seperated by a space"
#       else
#         puts "\nRecipe #{item}"
#       end
#       print '> '
#       recipe << gets.strip
#     end
#     recipe[2] = recipe[2].split(' ')
#     recipe
#   end
# end

class Recipe
  def initialize(name, description, ingredients)
    @name = name
    @description = description
    @ingredients = ingredients
    @recipe = []
  end

    def make_new
    @recipe += [@name, @description, @ingredients.split(' ')]
    @recipe
    end
end