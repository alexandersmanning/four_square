require 'board'
require 'player'

class Game
  attr_accessor :board, :current_player, :players

  def initialize
    @board = Board.new
    @players = []
  end

  def setup
    byebug
    2.times do |n|
      puts "player #{n + 1}, please enter your name"
      name = gets.chomp[/.{1,25}/]
      players << Player.new(name)
    end

    current_player = players.first
  end

  def turn

  end

  def play_game

  end

  def switch_players
    self.current_player = (self.current_player == @players.first ? @players.last : @players.first)
  end
end
