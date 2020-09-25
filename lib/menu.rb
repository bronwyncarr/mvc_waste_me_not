class Menu
  def heading
    puts 'Welcome to Waste - me - not'
    puts 'Did you know millions of tones of food is waster yeach year?'
    puts "...You're just one stop away from reducing that and making some delicious meals"
    puts 'what would you like to do?'
    print "> "

    puts '1. view recipes'
    puts '2. save and exit'
  end

  def user_input
    gets.chomp.to_i
  end

  def options
    heading
    loop do
      case user_input
      when 1
        puts 'you chose one'
      when 2
        puts 'Thanks for visiting'
        exit
      else
        puts 'Please enter 1 or 2'
      end
    end
  end
end

new_class = Menu.new
new_class.options
