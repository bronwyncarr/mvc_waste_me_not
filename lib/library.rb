require 'json'

class Library
  attr_accessor :recipes

  def initialize
    @path = '../public/data.json'
    returned_data = File.read(@path)
    @recipes = JSON.parse(returned_data)
    @tester = []
  end

  def save_recipes
    File.write(@path, @recipes)
  end

  def create_recipes
    new_recipe = Recipe.new
    @recipes << new_recipe.make_new_recipe
  end

  def read_recipes
    if @recipes == []
      puts 'No recipes to display'
    else
      table = TTY::Table.new(%i[Name Desciption Ingredients], @recipes)
      puts table.render(:ascii, alignment: [:center], resize: true)
    end
  end

  def get_ingredient
    ing_list = @recipes.map {|item| item[2]}.flatten.uniq
    prompt = TTY::Prompt.new
    @tester = prompt.multi_select("Select ingredient?", ing_list)
  end
    
  def search_any_recipes
    list = []
    @tester.each do |ing|
      @recipes.each do |item|
        list << item[0] if item[2].include?(ing)
      end
    end
    puts "Great news! #{@tester.join(", ")} occur in #{list.join(", ")}"
  end

  def search_recipes
    get_ingredient
    if @tester.empty?
      puts "You selected no ingredients. Remember to press space to select"
    elsif @tester.length ==1
      puts "you only selected one"
    else
      puts "You selected more than one ingredient."
      prompt = TTY::Prompt.new
      all_or_any = prompt.select("Would you like to see recipes that contain all the ingredients or any combination?", %w(All Any))
      if all_or_any == "Any"
        search_any_recipes
      else
        puts "any"
      end
    end 
  end
end


     # @recipes.each do |item|
      #   list << item[0] if item[2].include?(ing)
      # end
    # end
  #   puts "Great news! #{ing.capitalize} appears in #{list.join(', ')}"
  # end



  # def search_any_recipes
    # list = []
    # puts "\nWhat would you like to test?"
    # ing = gets.chomp
    # @recipes.each do |item|
    #   list << item[0] if item[2].include?(ing)
    # end
    # puts "Great news! #{ing.capitalize} appears in #{list.join(', ')}"
  # end
# # read














# returned_data = File.read('data.json')
# data = JSON.parse(returned_data)

# # write

# new_array = ["afsd", "fsad", ["fsad", "dfas"]]
# data << new_array

# # use either
# File.write("data.json", data.to_json) # or
# File.write("data.json", JSON.pretty_generate(data)) # prints prety
