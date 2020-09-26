class Recipe
  attr_reader :id, :name, :description, :ingredients

  # INPUTS = %i[id name desciption ingredients].freeze

  def initialize(recipe)
    @id = recipe[0]
    @name = recipe[1]
    @description = recipe[2]
    @ingredients = recipe[3]
  end

 

  # def display
  #   puts "#{id} #{name} #{description} #{ingredients}"
  # end

end
