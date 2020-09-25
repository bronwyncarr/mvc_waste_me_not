require 'tty-box'
require 'tty-screen'

require_relative 'menu'
require_relative 'recipe'

app = Menu.new
app.start
