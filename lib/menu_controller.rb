# This class handles the menu that is reoccuringly shown to the user.

# These methods one to six handle the presentation and user input for the options in the menu.
# Logic to reading/writing to the databsae in handled in the library class.
#
# I considered renaming them to more meaningful names however with only six,
# one to six was easier for me to work with. Any more or to make the project scalable
# I would rename these.

# I also refactored one to six into seperate modules as I thought this was a more
# scalable approach, see dev branch, but after doing so I found I prefered them in the menu class
# for this size project so I have reverted back to them being here (despite rubocop saying they are too long)

class Menu
  include Constants
  include Headings

  def initialize
    @recipe_list = Library.new
    @ingredient_list = IngredientList.new
    @menu_view = MenuViews.new
  end

  def heading(header)
    box = TTY::Box.frame(
      HOME, header,
      padding: 1,
      align: :center,
      width: TTY::Screen.width,
      border: { type: :thick, left: false, right: false }
    )
    print box
  end

  def want_to_view
    @menu_view.clear
    heading(VIEW)
    if @recipe_list.recipes.empty?
      @menu_view.no_recipes
    else
      puts @recipe_list.display_recipes
    end
  end

  def want_to_add
    @menu_view.clear
    heading(CREATE)
    @menu_view.new_recipe
    items = []
    values = %w[name description ingredients]
    values.each do |item|
        entered_item = @menu_view.new_recipe_input(item)
        items << entered_item
    end
    @recipe_list.create_recipes(items)
    @menu_view.to_add
  end

  def want_to_delete
    @menu_view.clear
    heading(DELETE)
    to_be_deleted = @menu_view.before_delete(@recipe_list.display_recipes)
    are_you_sure = @menu_view.are_you_sure
    if are_you_sure
      @menu_view.to_delete(to_be_deleted, @recipe_list)
    else
      @menu_view.not_to_delete
    end
  end

  def want_to_search
    @menu_view.clear
    heading(SEARCH)
    ingg_list = @ingredient_list.list_all_ingredients
    tester = @menu_view.prompt_user_for_ing(ingg_list)
    @ingredient_list.search_recipes(tester)
  end

  def want_all_ingredients
    @menu_view.clear
    heading(SHOW)
    puts @ingredient_list.list_all_ingredients
  end

  def want_to_exit
    @menu_view.clear
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
      want_to_view
    when 2
      want_to_add
    when 3
      want_to_delete
    when 4
      want_to_search
    when 5
      want_all_ingredients
    when 6
      want_to_exit
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
