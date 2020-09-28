class Ingredient
  include Constants

  def initialize
    returned_data = File.read(PATH)
    @recipes = JSON.parse(returned_data)
    @tester = []
  end

  def list_all_ingredients
    @ing_list = @recipes.map { |item| item[2] }.flatten.uniq.sort
  end

  def find_ingredient
    list_all_ingredients
    @tester = PROMPT.multi_select('Select ingredient?', @ing_list, cycle: true, per_page: 12)
  end

  def search_any_recipes
    any_list = []
    @tester.each do |ing|
      @recipes.each do |item|
        any_list << item[0] if item[2].include?(ing)
      end
    end
    any_list
  end

  def search_all_recipes
    all_list = []
    @recipes.each do |item|
      all_list << (item[0]) if @tester.intersection(item[2]) == @tester
    end
    all_list
  end

  def display_as_table(list)
    if list.empty?
      puts 'Sorry, none of your recipes include all those ingreditents.'
    else
      list_table = []
      puts "Great news! #{@tester.join(', ')} occur in the following delicious recipes:"
      list.each do |ing|
        @recipes.each do |item|
          list_table << item if item[0].include?(ing)
        end
      end
      table = TTY::Table.new(%i[Name Desciption Ingredients], list_table)
      puts table.render(:ascii, alignment: [:center], resize: true)
    end
  end

  def search_recipes
    find_ingredient
    if @tester.empty?
      puts 'You selected no ingredients. Remember to press space to select'
    elsif @tester.length == 1
      search_any_recipes
    else
      puts 'You selected more than one ingredient.'
      all_or_any = PROMPT.select('Would you like to see recipes that contain all the ingredients or any combination?', %w[Any All])
      if all_or_any == 'Any'
        display_as_table(search_any_recipes)
      else
        display_as_table(search_all_recipes)
      end
    end
  end
end
