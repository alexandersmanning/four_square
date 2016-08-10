class Board
	attr_accessor :grid

	def initialize
		@grid = Array.new(6) { Array.new(7) }
	end

	def col_size
		grid.first.count - 1
	end

	def row_size
		grid.count - 1
	end

	def inbounds(row, col)
		row.between?(0, row_size) && col.between?(0, col_size)
	end

	def [](row, col)
		grid[row][col]
	end

	def []=(row,col,value)
		grid[row][col] = value
	end

	def place(column, mark)
		row_size.downto(0) do |row|
			if self[row,column].nil?
				return self[row, column] = mark
			end
		end
	end

	def allowed_move(column)
		column.between?(0, col_size) && grid.first[column].nil? ? true : false
	end

	def check_row(row)
		row.uniq.compact.any? do |mark|
			row.count(mark) >= 4
		end
	end

	def check_diag(grid) #I don't like this, come back
		(0..grid.count - 1).each do |row|
			(0..grid.first.count - 1).each do |col|
				return true if (1...4).all? do |val|
					row_v, col_v = row + val, col + val
					inbounds(row_v, col_v) ?  grid[row_v][col_v] == grid[row][col] : false
				end
			end
		end
		return false
	end

	def win?
		checks = [
			grid.any? { |row| check_row(row) },
			grid.transpose.any? { |col| check_row(col) },
			check_diag(grid),
			check_diag(grid.transpose.reverse)
		]

		checks.any? { |check| check }
	end

	def display
		grid.each do |row|
		 puts (row.inject([]) do |line, value|
				line << (value.nil? ? " " : "#{value}")
			end.join(" | "))
		end
	end

end
