class MenuViews

  include Constants
  include Headings

  def initialize
  end

  # clear terminal
  def clear
    puts "\e[2J\e[f"
  end

  def no_recipe
    puts "There's no recipes in your database yet. Let's add some!"
  end
  
  def new_recipe
    puts "Let's create a new recipe!"
  end

  def new_recipe_input(item)
      puts "Please enter the recipe #{item}?"
      if item == 'ingredients'
        puts 'Please seperate with a space only.' 
      end
      print '> '
      begin
        entered_item = if item == 'ingredients'
                 gets.strip.downcase.split
               else
                 gets.strip.capitalize
               end
        raise('Required information') if item.empty?
      rescue StandardError => e
        p e
        p 'Please enter a value'
        retry
      end
      return entered_item
  end

  def to_add
    puts 'Your recipe has been added to the database.'
    puts
  end

  def before_delete(list)
    puts 'These are your recipes:'
    puts list
    puts "What's the title of the one you would like to delete?"
    print '> '
    gets.strip.capitalize
  end

  def are_you_sure
    PROMPT.yes?('Are you sure you want to delete')
  end

  def to_delete(to_be_deleted, list)
    puts list.delete_recipes(to_be_deleted) ? "Recipe #{to_be_deleted} has been deleted" : 'No matches found'
    puts
  end

  def not_to_delete
    puts "That's ok, nothing was deleted"
    puts
  end

  def list_ingredients
    puts 'Some of delicious things you might just have in your kitchen already:'
  end

  def prompt_user_for_ing(ing_list)
    begin
      @tester = PROMPT.multi_select('Please select one or more ingredients?', ing_list, cycle: true, per_page: 12)
      raise('Ingredient required') if @tester.empty?
    rescue StandardError => e
      puts e
      puts 'Please select an ingredient using the space bar'
      retry
    end
    @tester
  end

end