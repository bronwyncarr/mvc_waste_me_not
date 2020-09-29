module Constants
  path = File.dirname(__FILE__).split("/")
  path.pop
  RECIPE_DATABASE = "#{path.join("/")}/public/data.json"
  PROMPT = TTY::Prompt.new
  TABLE_HEADING = %i[Name Desciption Ingredients]
end

# # write
# new_array = ["afsd", "fsad", ["fsad", "dfas"]]
# data << new_array

# # use either
# File.write("data.json", data.to_json) # or
# File.write("data.json", JSON.pretty_generate(data)) # prints prety
