require './lib/ship'
require './lib/board'
require './lib/player'

player1 = Player.new
opponent = Player.new
board1 = Board.new
opponent_board = Board.new

puts "Player 1, please enter secret ship coordinates..."
coords1 = gets.chomp
ship1 = Ship.new(coords1)

puts "Player 2, please enter secret ship coordinates..."
coords2 = gets.chomp
ship2 = Ship.new(coords2)

player1.place(ship1, board1)
opponent.place(ship2, opponent_board)
attack = ""

until attack == "q"

# Player 1's turn

  player1.see_grid(opponent)
  puts "Player 1, choose coordinates for attack"
  attack = gets.chomp
  break if attack == "q"
  player1.fire(attack, opponent_board, opponent)
  player1.see_grid(opponent)
  break if opponent_board.game_over == true

  p "-----------------------------",
  "-----------------------------",
  "-----------------------------"

# Opponents turn

  opponent.see_grid(player1)
  puts "Player 2, choose coordinates for attack"
  attack = gets.chomp
  break if attack == "q"
  opponent.fire(attack, board1, player1)
  opponent.see_grid(player1)
  break if board1.game_over == true

  p "-----------------------------",
  "-----------------------------",
  "-----------------------------"


end
