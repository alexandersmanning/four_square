require "rspec"
require "board"
require 'byebug'

describe "Board" do 

	let(:empty_board) { Board.new }

	let(:board) { Board.new }
	let(:grid) { [[nil, nil], [nil, nil], [:r, :b]] }
	let(:row_4) { [[nil, nil, nil, nil], [nil, nil, nil, nil], [:r, :r, :r, :r], [:b, :b, :r, :r]] }
	let(:col_4) { [[:b, :r, :b, :r], [:r, :b, :b, :r], [:b, :b, :r, :r], [:b, :b, :r, :r]] }
	let(:diag_4) { [[:b, :b, :r, :b], [:r, :b, :b, :r], [:b, :r, :b, :r], [:r, :b, :r, :b]] }
	let(:right_diag) { [[:r, :b, :b, :r], [:r, :b, :r, :r], [:b, :r, :b, :r], [:r, :b, :r, :b]] }

	before :each do 
		allow(board).to receive(:grid).and_return(grid)
	end 

	describe "#initialize" do 
		it "creates a 7x6 empty board" do 
			expect(empty_board.grid.count).to eq 6

			empty_board.grid.each do |row|
				expect(row.count(nil)).to eq 7
			end 
		end 
	end 

	describe "#[]" do 
		it "returns values for position" do 
			expect(board[2,1]).to eq :b
			expect(board[2,0]).to eq :r
		end 
	end 

	describe "#[]=" do 
		it "updates the value for that square" do
			board[1,1] = :r
			expect(board[1,1]).to eq :r

			board[1,0] = :b
			expect(board[1,0]).to eq :b
		end 
	end 

	describe "#place_piece" do 
		it "puts a piece in the next available row for a specified column" do 
			board.place(1, :r)
			expect(board[1,1]).to eq :r

			board.place(1, :b)
			expect(board[0,1]).to eq :b
		end 
	end 

	describe "#allowed_move" do 
		it "returns true if spot if available" do 
			expect(board.allowed_move(1)).to be_truthy
		end 

		it "returns false if column is full" do 
			2.times { board.place(1, :r) }
			expect(board.allowed_move(1)).to be_falsey
		end 

		it "returns false if column does not exist" do 
			expect(board.allowed_move(3)).to be_falsey
		end 
	end 

	describe "#check_row" do 
		it "finds 4 in a row" do 
			allow(board).to receive(:grid).and_return(row_4)
			expect(board.check_row(board.grid[2])).to be_truthy

			expect(board.check_row(board.grid[0])).to be_falsey
			expect(board.check_row(board.grid[3])).to be_falsey
		end 
	end 

	describe "#win?" do 
		it "finds 4 in a row" do 
			allow(board).to receive(:grid).and_return(row_4)
			expect(board.win?).to be_truthy
		end 

		it "find 4 in a column" do 
			allow(board).to receive(:grid).and_return(col_4)
			expect(board.win?).to be_truthy
		end 

		it "finds 4 diagonal" do 
			allow(board).to receive(:grid).and_return(diag_4)
			expect(board.win?).to be_truthy
		end 

		it "finds 4 right-diagonal" do 
			allow(board).to receive(:grid).and_return(right_diag)
			expect(board.win?).to be_truthy
		end 
	end 

	describe "#full?" do 

	end 
end 