# gems
require 'tty-prompt'
require 'colorize'
require 'json'

# relative files
require_relative '../lib/constants'
require_relative '../lib/helpers'
require_relative '../lib/library'

describe Library do
  before(:each) do
    path = File.dirname(__FILE__).split('/')
    stub_const('Constants::RECIPE_DATABASE', "#{path.join('/')}/fake_data.json".freeze)
    fake_database = [
      ['Fritatta', 'Meat-free', %w[eggs onions capsicum cheese spinach]],
      ['Spag bol', 'Family Favourite', ['pork mince', 'onions', 'carrots', 'pasta']]
    ]
    File.write(Constants::RECIPE_DATABASE, JSON.pretty_generate(fake_database))
  end

  context 'When testing the create_recipe method in the Library class' do
    it 'should increase the length of the recipes array by one' do
      new_recipe = ['Brisket', 'Slow cooker', %w[brisket mustard spices onions]]
      test = Library.new
      prev_length = test.recipes.length
      test.create_recipes(new_recipe)
      expect(test.recipes.length).to eq(prev_length + 1)
    end

    it 'should add the new parameter to the end of the recipes array' do
      new_recipe = ['Brisket', 'Slow cooker', %w[brisket mustard spices onions]]
      test = Library.new
      test.create_recipes(new_recipe)
      expect(test.recipes.last).to eq(new_recipe)
    end
  end

  context 'When testing the delete method in the library class' do
    it 'should return true or false depending on whether the parameter occures in the recipe array' do
      test_ingredient = 'test'
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
