# coding: utf-8
require_relative 'sliding_piece'

class Rook < SlidingPiece
  def symbol
    '♜'
  end

  def move_dirs
    [
      [1, 0],
      [0, 1],
      [-1, 0],
      [0, -1]
    ]
  end
  def value
    5
  end
end
