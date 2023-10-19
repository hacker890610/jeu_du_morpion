require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/application'
require_relative 'lib/show'
require_relative 'lib/board'
require_relative 'lib/board_case'

app = Application.new
app.start_game

