# This class handles the menu that is reoccuringly shown to the user. 

class Menu
  include Constants
  include Headings

  def initialize
    @recipe_list = Library.new
  end

  # clear terminal
  def clear
    puts "\e[2J\e[f"
  end

  # header
  def heading(header)
    box = TTY::Box.frame(
      HOME, header,
      padding: 1,
      align: :center,
      width: TTY::Screen.width,
      border: {
        type: :thick,
        left: false,
        right: false
      }
    )
    print box
  end

# these methods one to six handle the presentation and user input for the options in the menu. Logic to reading/writing to the databsae in handled in the library class.

  def one
    clear
    heading(VIEW)
    if @recipe_list.recipes.empty?
      puts "There's no recipes in your database yet. Let's add some!"
    else
      puts @recipe_list.read_recipes
    end
  end

  def two
    clear
    heading(CREATE)
    items = []
    puts "Let's create a new recipe"
    values = %w[name description ingredients]
    values.each do |item|
      puts "Please enter the recipe #{item}?"
      print '> '
      begin
        item = if item == 'ingredients'
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
      items << item
    end
    @recipe_list.create_recipes(items)
    puts "Your recipe has been added to the database."
  end

  def three
    clear
    heading(DELETE)
    puts 'These are your recipes:'
    puts @recipe_list.read_recipes
    puts "What's the title of the one you would like to delete?"
    print '> '
    to_be_deleted = gets.strip.capitalize
    are_you_sure = PROMPT.yes?('Are you sure you want to delete')
    if are_you_sure
      puts @recipe_list.delete_recipes(to_be_deleted) ? "Recipe #{to_be_deleted} has been deleted" : 'No matches in your current database'
    else
      puts "That's ok, nothing was deleted"
    end
  end

  def four
    clear
    heading(SEARCH)
    search = Ingredient.new
    search.search_recipes
  end

  def five
    clear
    heading(SHOW)
    search = Ingredient.new
    puts 'The delicious things you might just have in your fridge like:'
    puts search.list_all_ingredients
  end

  def six
    clear
    heading(EXIT)
    @recipe_list.save_recipes
    exit
  end

  # displays menu options
  def menu_options
    PROMPT.select('What would you like to do:'.colorize(:light_blue), cycle: true) do |menu|
      menu.choice 'View all recipes', 1
      menu.choice 'Add a new recipe', 2
      menu.choice 'Delete a recipe', 3
      menu.choice 'Search recipe by ingredient', 4
      menu.choice 'View all your ingredient options', 5
      menu.choice 'Save and Exit', 6
    end
  end
    
  # actions option selected
  def menu_actions
    case menu_options
    when 1
      one
    when 2
      two
    when 3
      three
    when 4
      four
    when 5
      five
    when 6
      six
    end
  end

  # app entry point
  def start
    heading(STARTED)
    loop do
      menu_actions
    end
  end
end
