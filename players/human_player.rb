class HumanPlayer
  attr_reader :color
  attr_writer :board

  def initialize(color)
    @color = color
  end

  def make_move
    # puts "Enter your move"
    # i1, i2 = gets.chomp.split
    # raise BadInputError if i2.nil?

    i1 = @board.move_cursor

    i2 = @board.move_cursor

    [i1, i2]
  end

  # def input_to_pos(input)
  #   letter, number = input.split("")
  #   coord2 = letter.ord - 'a'.ord
  #   coord1 = number.to_i - 1
  #   [coord1, coord2]
  # end
end
