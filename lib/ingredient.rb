class Ingredient
  attr_accessor :recipes

  def create_ingredient_list
    ing_list = @recipes.map { |item| item[2] }.flatten.uniq.sort
    prompt = TTY::Prompt.new
    @tester = prompt.multi_select('Select ingredient?', ing_list, cycle: true, per_page: 12)
  end

  def search_any_recipes
    list = []
    @tester.each do |ing|
      @recipes.each do |item|
        list << item[0] if item[2].include?(ing)
      end
    end
    puts "Great news! #{@tester.join(', ')} occur in #{list.uniq.join(', ')}"
  end

  def search_all_recipes
    # @recipes.each do |item|
    #   if @tester.difference(item[2]) ==[]
    #   end
    # end

    # puts "#{@tester}"
    # puts "#{list_a}"
  end

  def start_search
    create_ingredient_list
    if @tester.empty?
      puts 'You selected no ingredients. Remember to press space to select'
    elsif @tester.length == 1
      puts 'you only selected one'
    else
      puts 'You selected more than one ingredient.'
      prompt = TTY::Prompt.new
      all_or_any = prompt.select('Would you like to see recipes that contain all the ingredients or any combination?', %w[Any All])
      if all_or_any == 'Any'
        search_any_recipes
      else
        search_all_recipes
      end
    end
  end

end