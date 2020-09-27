begin
  puts 'enter a number less than 100'
  number = gets.chomp
  raise('Custom range error') if number > 100
rescue StandardError => e
  p error # custom range error
  puts 'in rescue'
  retry
end

puts 'thanks for a number'

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
  puts 'enter a number less than 100'
  number = Integer(gets.chomp)
  number.to_i + 10
rescue StandardError => e
  p error # custom range error
  puts 'in rescue'
  retry
end
