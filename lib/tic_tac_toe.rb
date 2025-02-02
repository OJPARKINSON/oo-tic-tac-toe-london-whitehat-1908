class TicTacToe
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,4,8],
        [2,4,6],
        [0,3,6],
        [1,4,7],
        [2,5,8]
    ]

    def play
        turn until over?
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
      end

    def display_board
        puts "  #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input = user_input.to_i
        user_input = user_input - 1
        return user_input
    end
    
    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == 'X' || @board[index] == 'O'
      end
      

    def valid_move?(index)
        index.between?(0, 8) && !position_taken?(index)
      end
    
      def turn_count
        @board.count { |token| token == 'X' || token == 'O' }
      end

    def current_player
        count = turn_count()
        if count % 2 == 0 then 
            return "X"
        else  
            return "O"
       end
    end

    def turn 
        puts "Please enter a positon 1-9"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index) == true then
            move(index, current_player)
            display_board()
            return index
        else 
            turn()
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
          @board[combo[0]] == @board[combo[1]] &&
            @board[combo[1]] == @board[combo[2]] &&
            position_taken?(combo[0])
        end
    end

    def full?
        @board.all? { |token| token == 'X' || token == 'O' }
    end

    def draw?()
        !won?() && full?()
    end
      
    def over?()
        won?() || draw?()
    end

    def winner()
        if winning_combo = won?
          @board[winning_combo.first]
        end
      end
end





