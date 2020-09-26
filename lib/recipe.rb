class Recipe
  def make_new_recipe
    recipe = []
    inputs = %i[name desciption ingredients]
    puts 'Create a new recipe'
    puts 'Please enter the following information.'
    inputs.each do |item|
      puts "#{item}: "
      recipe << gets.strip
    end
    recipe[2] = recipe[2].split(',')
    recipe
  end
end
