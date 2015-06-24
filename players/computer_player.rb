class ComputerPlayer
  attr_reader :color
  attr_writer :board

  def initialize(color)
    @color = color
  end

  def make_move
    valid_moves_hash = {}
    @board.pieces(@color).each do |piece|
      valid_moves_hash[piece.pos] = piece.valid_moves unless piece.valid_moves.empty?
    end

    rand_key = valid_moves_hash.keys.sample
    random_move = [rand_key, valid_moves_hash[rand_key].sample]

    good_moves = []
    neutral_moves = []
    death_moves = []

    valid_moves_hash.each_pair do |start_pos, potential_positions|
      potential_positions.each do |potential_pos|
        if death_move?([start_pos, potential_pos])
          death_moves << [start_pos, potential_pos]
        elsif @board.piece_at(potential_pos)
          good_moves << [start_pos, potential_pos]
        else
          neutral_moves << [start_pos, potential_pos]
        end
      end
    end
    sleep(0.001)

    if !good_moves.empty?
      chosen_move = best_move(good_moves)
    elsif !neutral_moves.empty?
      chosen_move = neutral_moves.sample
    else
      chosen_move = death_moves.sample
    end
    chosen_move
  end

  #finds highest value target from good_moves
  #GOOD MOVES MUST BE AN ARRAY OF CAPTURE MOVES
  def best_move(good_moves)
    best_move = good_moves.sample
    good_moves.each do |move|
      if @board.piece_at(move.last).value >
                          @board.piece_at(best_move.last).value
        best_move = move
      end
    end
    best_move
  end

  def death_move?(move)
    duped_board = @board.deep_dup
    duped_board.move!(move.first, move.last)
    duped_board.piece_at(move.last).in_range_of_enemy?
  end
end
