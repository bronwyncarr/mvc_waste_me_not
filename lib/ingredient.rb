# This IngredientList class handles the search by ingredient feature and the display all ingredients.
# It itializes with data from the json file.

class IngredientList
  include Constants
  include Helpers

  def initialize
    @recipes = JSON.parse(File.read(RECIPE_DATABASE))
    @tester = []
  end

  # Used in option 4 + 5
  # Called from menu to list all ingredients and used to provide list for TTY prompt when searching
  def list_all_ingredients
    @ing_list = @recipes.map { |item| item[2] }.flatten.uniq.sort
  end

  # user_search_input
  def user_search_input
    begin
      list_all_ingredients
      @tester = PROMPT.multi_select('Please select one or more ingredients?', @ing_list, cycle: true, per_page: 12)
      raise('Ingredient required') if @tester.empty?
    rescue StandardError => e
      puts e
      puts 'Please select an ingredient using the space bar'
      retry
    end
    @tester
  end

  # any option
  def search_any_recipes
    any_list = []
    @tester.each do |ing|
      @recipes.each do |item|
        any_list << item if item[2].include?(ing)
      end
    end
    any_list.uniq
  end

  # all option
  def search_all_recipes
    all_list = []
    @recipes.each do |item|
      all_list << item if @tester.intersection(item[2]) == @tester
    end
    all_list
  end

  # displays in table using Helpers module
  def display_as_table(list)
    if list.empty?
      puts 'Sorry, none of your recipes include all those ingreditents.'
    else
      puts "Great news! #{@tester.join(', ')} occur in the following delicious recipes:"
      CreateTable(list)
    end
  end

  # Logic for all or any
  def handle_multiple
    puts 'You slist_all_ingredientselected more than one ingredient.'
    puts 'Would you like to see recipes containing:'
    all_or_any = PROMPT.select('ALL the ingredients or ANY combination?', %w[Any All])
    if all_or_any == 'Any'
      search_any_recipes
    else
      search_all_recipes
    end
  end

  # starts the search
  # calls user search input to get input then executes based on how many options chosen.
  def search_relist_all_ingredientscipes
    user_search_input
    if @tester.length == 1
      display_as_table(search_any_recipes)
    else
      display_as_table(handle_multiple)
    end
  end
end
