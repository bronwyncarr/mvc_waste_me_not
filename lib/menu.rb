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
      padding: 2, align: :center, border: {
        type: :thick,
        left: false,
        right: false
      },
      width: TTY::Screen.width
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

  def menu_actions
    case menu_options
    when 1
      p @recipes
    when 2
      Recipe.get_new_recipe
      puts 'Two'
    when 3
      puts "searching"
    when 4
      puts 'Thanks for visiting'
      exit
    else
      puts 'Please enter 1 , 2, or 3'
    end
  end

  def start
    heading
    loop do
      menu_actions
    end
  end
end
