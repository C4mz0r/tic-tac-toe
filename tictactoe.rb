class Game

  BLANK = " "
  
  def initialize(player1, player2)
    @player1 = player1;
    @player2 = player2;
    @board = [ [BLANK, BLANK, BLANK],
               [BLANK, BLANK, BLANK],
               [BLANK, BLANK, BLANK] ];
    @player1turn = true;
    @gameover = false;
  end

  def draw
      puts " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}"      
      puts "-----------"
      puts " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}"      
      puts "-----------"
      puts " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}"      
  end

  def promptUser
    while !@gameover do
      row = nil, col = nil

      # keep prompting so that user enters valid input
      loop do
        puts "It is your turn " + ( @player1turn ? @player1 : @player2 ) + ".  Enter your move.  (row col, e.g. 1 1)"
        row, col = gets.chomp.split
        row = row.to_i - 1
        col = col.to_i - 1
        if @board[row][col] == BLANK and row.between?(0,2) and col.between?(0,2) then
          break # valid move, so can break out of the loop
	else
	  puts "Invalid move detected."
	  self.draw
        end
      end

      @board[row][col] = @player1turn ? @player1: @player2 
      @player1turn = !@player1turn
      self.draw

      @gameover = hasWinner? || isBoardFull?
      #puts "haswinner #{hasWinner?} "
      #puts "boardfull #{isBoardFull?} "
    end
  end

  def hasWinner?
    if @board[0][0] == @board[0][1] and @board[0][1] == @board[0][2] and @board[0][0] != BLANK then
      return true
    elsif @board[1][0] == @board[1][1] and @board[1][1] == @board[1][2] and @board[1][0] != BLANK then
      return true
    elsif @board[2][0] == @board[2][1] and @board[2][1] == @board[2][2] and @board[2][0] != BLANK then
      return true
    elsif @board[0][0] == @board[1][0] and @board[1][0] == @board[2][0] and @board[0][0] != BLANK then
      return true
    elsif @board[0][1] == @board[1][1] and @board[1][1] == @board[2][1] and @board[0][1] != BLANK then
      return true
    elsif @board[0][2] == @board[1][2] and @board[1][2] == @board[2][2] and @board[0][2] != BLANK then
      return true
    elsif @board[0][0] == @board[1][1] and @board[1][1] == @board[2][2] and @board[0][0] != BLANK then
      return true
    elsif @board[0][2] == @board[1][1] and @board[1][1] == @board[2][0] and @board[0][2] != BLANK then
      return true
    end

    false
  end


  def isBoardFull?
    @board.each do |row|
      row.each do |cell|
        return false if cell == BLANK
      end
    end
    true
  end


end
