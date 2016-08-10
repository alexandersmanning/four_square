class Player
  attr_reader :name, :mark

  def initialize(name, mark)
    @mark = mark
    @name = name
  end

  def get_choice
    begin
      puts "#{name.capitalize}, please choose a column"
      input = gets.chomp[/\d+/]
      raise if input.nil? || input.to_i < 1
    rescue
      puts "Please enter a valid number"
      retry
    end

    return input.to_i - 1
  end
end
