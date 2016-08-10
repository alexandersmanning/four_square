require 'rspec'
require 'player'
require 'byebug'

describe "Player" do
    before :each do
      @player = Player.new("Alex")
    end

  describe "#get_choice" do

    before(:each) do
      $stdin = StringIO.new("1\n")
      $stdout = StringIO.new
    end

    it "requests the user choose a column" do
      expect(@player.get_choice).to eq 0
      expect($stdout.string).to match(/choose/)
    end

    it "Catches non-numeric input" do
      $stdin = StringIO.new("a\n3\n")
      expect(@player.get_choice).to eq 2
      expect($stdout.string).to match(/valid/)
    end
  end
end
