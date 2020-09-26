require_relative 'recipe'

class Menu
  def initialize
    @recipes = []
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
    prompt.select("What would you like to do") do |menu|
      menu.choice "View all recipes", 1
      menu.choice "Add a new recipe", 2
      menu.choice "Search recipe by ingredient", 3
      menu.choice "View all ingredients", 4
      menu.choice "Save and Exit", 5
    end
  end

  def terminal_table
    if @recipes == []
      puts 'No recipes to display'
    else
      table = TTY::Table.new(%i[id name desciption ingredients], @recipes)
      puts table.render(:ascii, alignment: [:center], resize: true)
    end
  end

  def menu_actions
    case menu_options
    when 1
      terminal_table
    when 2
      
      new_recipe = Recipe.new
      new_new = new_recipe.make_new_recipe
      new_new.unshift(@recipes.length + 1)
      @recipes << new_new
    when 3
      # list = []
      puts "\nWhat would you like to test?"
      ing = gets.chomp
      @recipes.each do |item|
        p item
        if item[3].include?(ing)
         puts item[1]
        end
      end
      # puts " Great news! #{ing} appears in #{list}"
    when 4
      # @recipes.include?
    when 5
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
