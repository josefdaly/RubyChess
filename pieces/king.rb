# coding: utf-8
require_relative 'stepping_piece'

class King < SteppingPiece
  def symbol
    '♚'
  end

  def move_diffs
    [
      [1, 1],
      [1, 0],
      [0, 1],
      [-1, 1],
      [1, -1],
      [-1, -1],
      [-1, 0],
      [0, -1]
    ]
  end
end
