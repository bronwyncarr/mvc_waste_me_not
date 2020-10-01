# These are the other constants in the app seperated from the Heading constants. They include database and gem related constants. 
module Constants
  path = File.dirname(__FILE__).split('/')
  path.pop
  RECIPE_DATABASE = "#{path.join('/')}/public/data.json".freeze
  PROMPT = TTY::Prompt.new(active_color: :cyan)
  TABLE_HEADING = ['Name'.colorize(:light_blue), 'Desciption'.colorize(:light_blue), 'Ingredients'.colorize(:light_blue)].freeze
end
