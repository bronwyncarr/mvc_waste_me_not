require 'tty-box'
require 'tty-screen'
require 'tty-table'
require 'tty-prompt'

require_relative 'constants'
require_relative 'ingredient'
require_relative 'library'
require_relative 'recipe'
require_relative 'menu'
require_relative 'constants'

app = Menu.new
app.start
