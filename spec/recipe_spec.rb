# require '../lib/recipe'

# describe Recipe do
#   context “When testing the Recipe class” do

#      it "should return 4 parameters" do
#         rec = Recipe.new
#         message = hw.say_hello
#         expect(message).to eq "Hello World!"
#      end
#   end
# end


# gems
require 'tty-box'
require 'tty-screen'
require 'tty-table'
require 'tty-prompt'
require 'colorize'

# relative files
require_relative '../lib/constants'
require_relative '../lib/headings'
require_relative '../lib/ingredient'
require_relative '../lib/library'
require_relative '../lib/menu'

#  describe Library do
#    context "When testing the create_recipe method in the Library class" do
#       it "should increase the length of the @recipes array by one" do
#         new_recipe = ["Brisket", "Slow cooker", ["brisket", "mustard", "spices", "onions"]]
#         test = Library.new
#         prev_length = test.recipes.length
#         test.create_recipes(new_recipe) 
#         expect(test.recipes.length).to eq (prev_length + 1)
#       end

#       it "should add the new parameter to the end of the @recipes array" do
#         new_recipe = ["Brisket", "Slow cooker", ["brisket", "mustard", "spices", "onions"]]
#         test = Library.new
#         test.create_recipes(new_recipe) 
#         expect(test.recipes.last).to eq (new_recipe)
#       end
#    end
#  end

 describe Library do
  context "When testing the delete method in the library class" do
     it "should return true or false depending on whether the parameter occures in the recipe array" do
      test_ingredient = "test"  
      delete_test = Library.new
      deleted = delete_test.delete_recipes(test_ingredient)
      if delete_test.recipes.include?(deleted)
        expect(deleted).to be true
      else
        expect(deleted).to be false
      end
     end
    end
  end



describe Menu do
  context "when testing menu class" do
     it "should return 4 parameters" do
      number = 1  
      test = Menu.new
      expect(test.menu_actions(number)).to eq test.one
     end
  end
end