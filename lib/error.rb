begin
  puts "enter a number less than 100"
  number = gets.chomp
  if number > 100
    raise("Custom range error")
  end
rescue => exception
  p error # custom range error
  puts "in rescue"
  retry
end

puts "thanks for a number"

# can explicitly target type of error with 
# rescue Argument = exception

# can leave out if raise and just rescue any error

# javascript
# try
# throw
# catch

# retry for second go

# can use type for validating
begin
  puts "enter a number less than 100"
  number = Integer(gets.chomp)
  number.to_i + 10
rescue => exception
  p error # custom range error
  puts "in rescue"
  retry
end
