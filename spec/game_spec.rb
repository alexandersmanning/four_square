require 'rspec'
require 'game'
require 'byebug'

describe "Game" do
  before :each do
    @game = Game.new
    @player_1 = double("alex")
    allow(@player_1).to receive(:name) { "alex" }
    allow(@player_1).to receive(:mark) { :r }

    @player_2 = double("keicy")
    allow(@player_2).to receive(:name) { "keicy" }
    allow(@player_2).to receive(:mark) { :b }

    @game.players = [@player_1, @player_2]
    @game.current_player = @player_1

    @board = @game.board
  end

  describe "#initialize" do
    it "creates a board" do
      expect(@game.board).to be_a_kind_of Board
    end
  end

  describe "#switch_players" do
    it "changes the player" do
      @game.switch_players!
      expect(@game.current_player).to eq @player_2
    end
  end

  describe "#turn" do
    xit "checks the players move" do 
      allow(@player_1).to receive(:get_choice) { 1 }

     
      expect(@game.board).to receive(:allowed_move).with(1)
      expect(@game.board).to receive(:place).with(1, :r)
      @game.turn

    end 
  end

end
