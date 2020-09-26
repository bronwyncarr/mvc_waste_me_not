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
    puts ''
    puts 'What would you like to do?'
    puts '1. view recipes'
    puts '2. add recipe'
    puts '3. search recipes by ingredient'
    puts '4. save and exit'
    gets.chomp.to_i
  end

  def terminal_table
    if @recipes == []
      puts 'no recipes to display'
    else
      table = TTY::Table.new(%i[id name desciption ingredients], @recipes)
      puts table.render(:ascii, alignment: [:center], width: TTY::Screen.width)
    end
  end

  def menu_actions
    case menu_options
    when 1
      terminal_table
    when 2
      new_recipe = Recipe.new
      @recipes << new_recipe.make_new_recipe
    when 3
      puts 'searching'
    when 4
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
