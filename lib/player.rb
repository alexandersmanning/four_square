class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_choice
    begin
      puts "Please choose a column"
      input = gets.chomp[/\d+/]
      raise if input.nil? || input.to_i < 1
    rescue
      puts "Please enter a valid number"
      retry
    end

    return input.to_i - 1
  end
end
