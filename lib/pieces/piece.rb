# coding: utf-8
class Piece
  attr_reader :color
  attr_accessor :pos, :moved

  def initialize(board, color, pos)
    @board = board
    @color = color
    @pos = pos
    @moved = false
  end

  def in_range_of_enemy?
    @color == :white ? enemy_color = :black : enemy_color = :white
    @board.pieces(enemy_color).each do |piece|
      return true if piece.valid_moves.include?(@pos)
    end
    false
  end

  def symbol
    raise NotImplementedError.new ("No symbol!")
  end

  def dup(dup_board)
    self.class.new(dup_board, @color, @pos.dup)
  end

  def valid_moves
    moves.reject { |move| move_into_check?(move) }
  end

  def move_into_check?(move)
    duped_board = @board.deep_dup
    duped_board.move!(self.pos, move)
    duped_board.in_check?(@color)
  end

  def sum_positions(pos1, pos2)
    [pos1.first + pos2.first, pos1.last + pos2.last]
  end
end
