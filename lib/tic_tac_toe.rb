class TicTacToe
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end 
    
      
WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
  #### `#display_board`

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
 

    def input_to_index(player_input)
        player_input = player_input.to_i
        index = player_input-1
        return index
    end
    
    def move(index, player = 'X')
            @board[index] = player
    end
   
    def position_taken?(index)
        @board[index]== "X" || @board[index] == "O"
    end
      
      
    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end
    def turn
        puts "Please enter 1-9:"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index)
          move(index, current_player)
          display_board
        else
          turn
    end
   
      
    def turn_count
        counter = 0
        @board.each do |space|
          if space == 'X' || space =='O'
            counter += 1
          end
    counter
    end
      
    def current_player
        turn_count% 2 == 0 ? "X" : "O"
    end
      
      
    def check_win_combo?(player, win_combo)
        win_combo.all? do |position|
          @board[position] == player
        end
    end
      
      
    def won?
        WIN_COMBINATIONS.each do |win_combo|
          if check_win_combo?('X', win_combo)
            return win_combo
            elsif check_win_combo?('O', win_combo)
            return win_combo
        end
      end
      return false 
    end
      
    def full?
        @board.all?{|token| token == "X" || token == "O"}
    end
      
    def draw?
        !won? && full?
    end
      
    def over?
        if won?|| draw?||full?
        return true
     end
      
      def winner
        if win_combo = won?
          return @board[win_combo.first]
        end
      end 

    def play
        puts "#{current_player.name} has randomly been selected as the first player"
        while true
          board.formatted_grid
          puts ""
          puts solicit_move
          x, y = get_move
          board.set_cell(x, y, current_player.color)
          if board.game_over
            puts game_over_message
            board.formatted_grid
            return
          else
            switch_players
           end
        end    
    end
end
end