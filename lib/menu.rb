require_relative 'recipe'

class Menu
  include Headings

  def initialize
    @recipe_list = Library.new
  end

  # clears the screen
  def clear
    puts "\e[2J\e[f"
  end

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

  def menu_options
    prompt = TTY::Prompt.new
    prompt.select('What would you like to do', cycle: true) do |menu|
      menu.choice 'View all recipes', 1
      menu.choice 'Add a new recipe', 2
      menu.choice 'Delete a recipe', 3
      menu.choice 'Search recipe by ingredient', 4
      menu.choice 'View all your ingredient options', 5
      menu.choice 'Save and Exit', 6
    end
  end

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
    puts "Let's create a new recipe"
    # seems repetativey but easier to read with = amount of lines
    puts "What's the recipe name?"
    print "> "
    name = gets.strip.downcase
    puts "Describe the recipe?"
    print "> "
    description = gets.strip.downcase
    puts "List the ingredients, sperated by a space"
    print "> "
    ingredients = gets.strip.downcase
    @recipe_list.create_recipes(name, description, ingredients)
  end


  def menu_actions
    case menu_options
    when 1
      one
    when 2
      two
    when 3
      clear
      heading(DELETE)
      @recipe_list.delete_recipes
    when 4
      clear
      heading(SEARCH)
      search = Ingredient.new
      search.search_recipes
    when 5
      clear
      heading(SHOW)
      search = Ingredient.new
      puts "The delicious things you might just have in your fridge like:"
      puts search.list_all_ingredients
    when 6
      @recipe_list.save_recipes
      puts 'Thanks for visiting'
      exit
    else
      p 'Please enter 1 to 6'
    end
  end

  def start
    heading(STARTED)
    loop do
      menu_actions
    end
  end
end

