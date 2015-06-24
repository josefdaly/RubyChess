# coding: utf-8
require_relative 'game'
require_relative 'players/human_player.rb'
require_relative 'players/computer_player.rb'

class RubyChess

  def run
    clear_screen
    choose_players
    game = Game.new(@white_player, @black_player)
    game.play
    choice = reset
    run if choice == 'y' || choice =='Y' || choice == 'yes' || choice == 'Yes'
  end

  def choose_players
    puts "Welcome to RubyChess by Joe Daly"
    puts
    puts "Who will play white? (Human or Computer)"
    white_choice = gets.chomp
    puts "Who will play black? (Human or Computer)"
    black_choice = gets.chomp

    set_players(white_choice, black_choice)
  end

  def clear_screen
    system('clear')
  end

  def reset
    puts "Would you like to play again? (y/n)"
    gets.chomp
  end

  def set_players(white_choice, black_choice)
    if white_choice == 'Human' || white_choice == 'human'
      @white_player = HumanPlayer.new(:white)
    else
      @white_player = ComputerPlayer.new(:white)
    end
    if black_choice == 'Human' || black_choice == 'human'
      @black_player = HumanPlayer.new(:black)
    else
      @black_player = ComputerPlayer.new(:black)
    end
  end

end
