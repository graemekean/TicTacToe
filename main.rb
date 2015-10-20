require 'pry-byebug'
require_relative 'game'
require_relative 'move'
# require_relative 'validation'

puts `clear`
puts "Playing TTT..."

def expect(thing, other_thing)
  raise "oops - here is the error message = #{thing} did not equal #{other_thing}" unless thing == other_thing
end 

def print_board(g)
  puts(g.board.each_slice(3).map do |row|
    row.map { |e| e || ' ' }.join(' | ')
  end.join("\n---------\n"))
end

# g = Game.new
#raise an error unless test pasts
# g.player1 = "Michael"
# g.player2 = "Neil"



# expect g.class.name, "Game" #this should be true right

# expect g.moves, [] #should also be true

# expect g.player1, "Michael"
# expect g.player2, "Neil"

# g.make_move "Michael", 4
# expect g.moves.last.class.name, "Move"
# expect g.moves.last.player, "Michael"
# expect g.moves.last.square, 4
# expect g.moves.last.symbol, "X"

# g.make_move "Neil", 2
# expect g.moves.last.player, "Neil"
# expect g.moves.last.square, 2
# expect g.moves.last.symbol, "O"

# expect g.finished?, false

# g.make_move "Michael", 0
# g.make_move "Neil", 1
# g.make_move "Michael", 2



# expect g.moves.last.valid?(g), false

# expect g.finished?, true

# expect g.result, "Michael Won!"


g = Game.new

def get_names(g)

  puts "What is player 1's name?"
  print "=> "
  g.player1 = gets.chomp
  if g.player1 == ''
    g.player1 = "Player 1"
  else
  end

  puts "What is player 2's name?"
  print "=> "
  g.player2 = gets.chomp

  if g.player2 == ''
    g.player2 = "Player 2"

  elsif g.player1 == g.player2
    puts "Each player must have a unique name"
    get_names(g)
  else
  end
end

# def check_square(square)
#   if square == ''
#     puts "please select a nummber from 0 to 8"
#     square = gets.chomp.to_i
#     check_square(square)
#   else
#   end
# end

def play_game(g)

  until g.finished?
    puts `clear`
    puts print_board(g)
    puts "Where's #{g.whose_turn}'s move?"
    # g.make_move g.whose_turn, gets.chomp.to_i

  # is the same as
  player = g.whose_turn
  square = 9
  square = gets.chomp.to_i
  # check_square(square)

  g.make_move player, square

end



puts `clear`
puts print_board(g)
puts g.result
puts "1. Play another game with the same players"
puts "2. Start a new game with new players"
puts "ANY OTHER KEY QUITS GAME"
choice = gets.chomp.to_i
case choice
when 1
  i = g.moves.length
  until i == -1 do
    g.moves.delete_at(i)
    g.used_squares.delete_at(i)
    i -= 1
  end
  play_game(g)
when 2
  g = Game.new
  get_names(g)
  play_game(g)
else
  exit

end
end
get_names(g)
play_game(g)

binding.pry;''





