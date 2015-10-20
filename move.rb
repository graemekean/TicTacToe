class Move

  attr_reader :square, :player, :symbol

  def initialize(player, square, symbol)
    @square = square
    @symbol = symbol
    @player = player
  end

  # def valid?(g)
  #   binding.pry
  #   case g.used_squares.include?()


  #   # case g.moves.contains?(g.moves.last.square)

  # end

end