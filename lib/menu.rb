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
    prompt.select('What would you like to do') do |menu|
      menu.choice 'View all recipes', 1
      menu.choice 'Add a new recipe', 2
      menu.choice 'Search recipe by ingredient', 3
      menu.choice 'View all ingredients', 4
      menu.choice 'Save and Exit', 5
    end
  end

  def menu_actions
    case menu_options
    when 1
      @recipe_list.read_recipes
    when 2
      @recipe_list.create_recipes
    when 3
      @recipe_list.search_recipes
    when 4
      # @recipes.include?
    when 5
      @recipe_list.save_recipes
      puts 'Thanks for visiting'
      exit
    else
      p 'Please enter 1 , 2, or 3'
    end
  end

  def start
    heading
    loop do
      menu_actions
    end
  end
end
