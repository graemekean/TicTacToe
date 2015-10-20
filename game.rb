class Game


  attr_accessor :player1, :player2
  attr_reader :moves, :used_squares

  WINNING_LINES = [[0,1,2],[3,4,5],[6,7,8],
  [0,3,6],[1,4,7],[2,5,8],
  [0,4,8],[2,4,6]]

  def initialize
    @moves = []
    @used_squares = []
  end

  def make_move(player, square)
    if square >= 0 && square < 9 && !@used_squares.include?(square)
      @moves << Move.new(player, square, symbol_for_player(player))
      @used_squares << square
    else
      puts "That is not a valid selection"
      sleep(2)


    end
  end

  def finished?
    winning_game? || drawn_game?
  end

  def board
    #THIS IS THE NEW WAY TO DO THE CODE SHOWN BELOW
    # empty_board.tap do |board|
    #   moves.each do |move|
    #     board[move.square] = move.symbol
    #   end
    # end

    board = empty_board
    moves.each do |move|
      board[move.square] = move.symbol
    end
    board # returns board
  end

  def empty_board
    Array.new(9, nil)
  end

  def result
    case
    when winning_game?
      "#{moves.last.player} Won!"
    when drawn_game?
      "It is a draw!"
    else
      "The game is still in progress."
    end
  end

  def whose_turn
    return player1 if moves.empty?
    moves.last.player == player1 ? player2 : player1 #ternary operator
  end

  private
  def winning_game?
    !!WINNING_LINES.detect do |winning_line|
      %w(XXX OOO).include?(winning_line.map { |e| board[e] }.join)
    end
  end

  private
  def drawn_game?
    #is the game a draw
    moves.size == 9
    #OR (0..8).all? {|i| moves[i]}
  end

  private  #everything below here is private
  def symbol_for_player(player)
    case player
    when player1
      "X"
    when player2
      "O"
    else
      raise "Oi, That's not one of my players"
    end
  end

end