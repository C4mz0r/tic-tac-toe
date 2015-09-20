require 'spec_helper'
require_relative '../tictactoe.rb'

describe Game do
	before :each do 
		@game = Game.new("X","O")
	end

	describe "#isBoardFull?" do

		it "returns false if there are any empty spaces" do
			@game.isBoardFull?.should == false
		end

		it "returns true if all spaces are filled" do
			@game.instance_variable_set(:@board, Array.new(3,Array.new(3,'z')) )
			@game.isBoardFull?.should == true
		end
	end

	describe "#hasWinner?" do
		
		it "returns false if there are no 3 of the same symbols in a row" do
			cats_board = [ 	['a', 'a', 'b'], 
					['b', 'b', 'a'], 
					['a', 'b', 'a'] ] 
			@game.instance_variable_set(:@board, cats_board)
			@game.hasWinner?.should == false
		end

		it "returns false if the board is empty" do
			cats_board = [ 	[' ', ' ', ' '], 
					[' ', ' ', ' '], 
					[' ', ' ', ' '] ] 
			@game.instance_variable_set(:@board, cats_board)
			@game.hasWinner?.should == false
		end
		
		it "returns true for 3 matches on first row" do
			winning_board = [['a', 'a', 'a'], 
					[' ', ' ', ' '], 
					[' ', ' ', ' '] ]
			@game.instance_variable_set(:@board, winning_board)
			@game.hasWinner?.should == true
		end

		it "returns true for 3 matches on middle row" do
			winning_board = [[' ', ' ', ' '], 
					['a', 'a', 'a'], 
					[' ', ' ', ' '] ]
			@game.instance_variable_set(:@board, winning_board)
			@game.hasWinner?.should == true
		end

		it "returns true for 3 matches on bottom row" do
			winning_board = [[' ', ' ', ' '], 
					[' ', ' ', ' '], 
					['a', 'a', 'a'] ]
			@game.instance_variable_set(:@board, winning_board)
			@game.hasWinner?.should == true
		end

		it "returns true for 3 matches on first column" do
			winning_board = [['a', ' ', ' '], 
					['a', ' ', ' '], 
					['a', ' ', ' '] ]
			@game.instance_variable_set(:@board, winning_board)
			@game.hasWinner?.should == true
		end

		it "returns true for 3 matches on middle column" do
			winning_board = [[' ', 'a', ' '], 
					[' ', 'a', ' '], 
					[' ', 'a', ' '] ]
			@game.instance_variable_set(:@board, winning_board)
			@game.hasWinner?.should == true
		end

		it "returns true for 3 matches on last column" do
			winning_board = [[' ', ' ', 'a'], 
					[' ', ' ', 'a'], 
					[' ', ' ', 'a'] ]
			@game.instance_variable_set(:@board, winning_board)
			@game.hasWinner?.should == true
		end

		it "returns true for 3 matches on main diagonal" do
			winning_board = [['a', ' ', ' '], 
					[' ', 'a', ' '], 
					[' ', ' ', 'a'] ]
			@game.instance_variable_set(:@board, winning_board)
			@game.hasWinner?.should == true
		end

		it "returns true for 3 matches on secondary diagonal" do
			winning_board = [[' ', ' ', 'a'], 
					[' ', 'a', ' '], 
					['a', ' ', ' '] ]
			@game.instance_variable_set(:@board, winning_board)
			@game.hasWinner?.should == true
		end

	end

	describe "#promptUser" do
		it "prints an error message if an out of bounds move is detected" do
			# to do
			return false
		end
	
		it "prints an error message if user specifies a square that is already filled" do
			# to do
			return false
		end

		it "alternates between asking player 1 and player 2 for inputs" do
			# to do
			return false
		end

	end
end
