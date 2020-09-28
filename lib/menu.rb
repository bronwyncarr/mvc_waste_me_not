require_relative 'recipe'

class Menu
  def initialize
    @recipe_list = Library.new
  end

  def heading
    box = TTY::Box.frame(
      'Welcome to WASTE-ME-NOT',
      '',
      'Have you got some random veggies in your fridge?',
      'Odd bits of leftovers?',
      "You're one step away from reducing your waste....",
      '...and having a delicious meal!',
      padding: 2,
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

  def menu_actions
    case menu_options
    when 1
      @recipe_list.read_recipes
    when 2
      @recipe_list.create_recipes
    when 3
      @recipe_list.delete_recipes
    when 4
      search = Ingredient.new
      search.search_recipes
    when 5
      search = Ingredient.new
      puts "There's delicious things you might just have in your fridge like:"
      puts search.list_all_ingredients
    when 6
      puts 'Thanks for visiting'
      exit
    else
      p 'Please enter 1 to 6'
    end
  end

  def start
    heading
    loop do
      menu_actions
    end
  end
end
