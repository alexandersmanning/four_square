require 'rspec'
require 'game'
require 'byebug'

describe "Game" do
  before :each do
    @game = Game.new
    @player_1 = double("alex")
    allow(@player_1).to receive(:name) { "alex" }

    @player_2 = double("keicy")
    allow(@player_2).to receive(:name) { "keicy" }

    @game.players = [@player_1, @player_2]
    @game.current_player = @player_1
  end

  describe "#initialize" do
    it "creates a board" do
      expect(@game.board).to be_a_kind_of Board
    end
  end

  describe "#switch_players" do
    it "changes the player" do
      @game.switch_players
      expect(@game.current_player).to eq @player_2
    end
  end

  describe "#turn" do
    it "gets a players move"
  end

  describe "#play_game" do

  end
end
