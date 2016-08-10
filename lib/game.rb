require_relative 'board'
require_relative 'player'
require 'byebug'

class Game
  attr_accessor :board, :current_player, :players

  def initialize
    @board = Board.new
    @players = []
  end

  def setup
    mark = [:r, :b].shuffle

    2.times do |n|
      puts "player #{n + 1}, please enter your name"
      name = gets.chomp[/.{1,25}/]
      players << Player.new(name, mark.pop)
    end

    @current_player = players.last
  end

  def turn
    system("clear")
    @board.display

    begin 
      col = @current_player.get_choice
      puts "stuff" unless @board.allowed_move(col)
    rescue 
      puts "You cannot place a piece there"
      retry
    end 

    board.place(col, current_player.mark)
  end

  def play_game
    until (win = board.win?) || (full = board.full?)
      switch_players!
      turn
    end 

    puts "#{current_player.name} won!" if win 
    puts "Game tied" if full
    @board.display
  end

  def switch_players!
    self.current_player = (self.current_player == @players.first ? @players.last : @players.first)
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.setup
  game.play_game
end 
