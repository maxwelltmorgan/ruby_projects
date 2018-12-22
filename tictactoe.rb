class TicTacToe

    def initialize(player1 = 'Player 1', player2 = 'Player 2')
        @player1_name = player1
        @player2_name = player2
        @board = [1,2,3,4,5,6,7,8,9]
        @current_player = player1
        @current_marker = 'X'
        @game_over = false
    end

    def update_board(selection)
        @board[selection] = @current_marker
        toggle_current_player
    end

    def show_board
        puts ''
        puts "Player1: #{@player1_name}\tPlayer2: #{@player2_name}"
        puts ''
        puts "\t #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "\t-----------"
        puts "\t #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "\t-----------"
        puts "\t #{@board[6]} | #{@board[7]} | #{@board[8]} "
        puts ''
    end

    def toggle_current_player
        @current_player == @player1_name  ? @current_player = @player2_name :  @current_player = @player1_name
        toggle_marker
    end

    def toggle_marker
        @current_marker == 'X'  ? @current_marker = 'O' :  @current_marker = 'X'
    end

    def toggle_game
        @game_over ? @game_over = false : @game_over = true
    end

    def current_player
        @current_player
    end

    def play_round
        while @game_over == false
            puts "Go #{current_player} Go!!!"
            puts ''
            puts "Enter # to make your play"
            selection = gets.to_i - 1

            if @board[selection] != "X" && @board[selection] != "O"
                system "clear" or system "cls"
                update_board(selection)
                show_board
                winner
            else
                puts "Position already taken"
                play_round
            end
        end
    end

    WIN_COMBO = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def winner
        if draw
            puts "IT'S A DRAW"
            toggle_game
        end

        WIN_COMBO.each { |combo|
            if @board[combo[0]] == 'X' && @board[combo[1]] == 'X' && @board[combo[2]] == 'X'
                puts "#{@player1_name} wins"
                toggle_game
            elsif @board[combo[0]] == 'O' && @board[combo[1]] == 'O' && @board[combo[2]] == 'O'
                puts "#{@player2_name} wins"
                toggle_game
            end
        }
    end

    def draw
        @board.all? { |x| x == 'X' || x == 'O' }
    end

end

puts "Welcome to TIC TAC TOE"
puts ''
puts "Enter player 1 name"
p1 = gets.chomp
puts ''
puts "Enter player 2 name"
p2 = gets.chomp
a = TicTacToe.new(p1,p2)
system "clear" or system "cls"
a.show_board

a.play_round
