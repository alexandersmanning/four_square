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

	def check_diag(grid)
		(0..row_size).each do |row|
			(0..col_size).each do |col|
				return true if (1...4).all? do |val|
					row_v, col_v = row + val, col + val
					inbounds(row_v, col_v) ?  self[row_v, col_v] == self[row, col] : false 
				end 
			end 
		end 
	end 

	def win?

	end

end 