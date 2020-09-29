@recipes = [["Fritatta", "Meat-free", ["eggs", "onions", "capsicum", "cheese", "spinach"]], ["Spag bol", "Family Favourite", ["pork mince", "onions", "carrots", "pasta"]], ["Burritos", "Freezer friendly", ["wraps", "onions", "carrots", "cheese", "mince"]], ["Dumplings", "Banquet", ["pork mince", "cabbage", "onions", "wontons"]], ["Risotto", "Super creamy", ["rice", "onions", "cheese", "stock"]], ["fds", "fasd", ["fsda"]], ["fads", "fasd", "fsad hdf sfda"], ["fds", "fsda", "fsd"], ["safd", "sfad", "fasd"]]

puts "what?"
to_be_deleted = gets.strip

@is_it_there = false

@recipes.each do |item|
  if to_be_deleted == item[0]
    @is_it_there = true
    break
  else
    @is_it_there = false
  end
end

puts is_it_there