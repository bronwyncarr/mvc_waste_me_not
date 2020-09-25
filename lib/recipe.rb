class Recipe
  attr_reader :id, :name, :description, :ingredients

  INPUTS = %i[id name desciption ingredients].freeze

  def initialize(id, name, description, ingredients)
    @id = id
    @name = name
    @description = description
    @ingredients = ingredients
  end

  def self.get_new_recipe
    recipe = {}
    puts 'Create a new recipe'
    puts 'Please enter the following information.'
    INPUTS.each do |item|
      puts "#{item}: "
      response = gets.strip
      recipe[item] = response
    end
    recipe
    puts 'Your new recipe has been added.'
  end
end
