class User
    attr_reader :icon
    attr_accessor :wins, :losses
    @@counter = 0
    
    def initialize
        @icon = "X" if @@counter == 0
        @icon = "O" if @@counter > 0
        @wins = 0
        @losses = 0
        @@counter += 1
    end
    
    def selection
        i = 0
        while i < 1
            p "#{self} make a selection..."
            temp = gets.chomp.upcase
            if temp.length != 2
                p "Error, input must be 2 characters..."
            elsif (["A","B","C"].include? (temp[0])) == false
                p "Error, please select either row a, b, or c..."
            elsif (["1","2","3"].include? (temp[1])) == false
                p "Error, please select a column as 1, 2, or 3..."
            else
                p "input successful..."
                return temp
            end
        end
    end
    
end

class Game < User
    attr_accessor :player_1, :player_2, :board
    
    def initialize()
        @player_1 = User.new
        @player_2 = User.new
        @board = {
        "row A": ["-","-","-"],
        "row B": ["-","-","-"],
        "row C": ["-","-","-"]
        }
    end

    def draw_board
        @board.each do |key, value|
            p value
        end
    end
    
    def reset
        @player_1.wins = 0
        @player_2.wins = 0
        @board = {
        "row A": ["-","-","-"],
        "row B": ["-","-","-"],
        "row C": ["-","-","-"]
        }
        play_round
    end
    
    def stalemate_check
        isTrue = 0
        @board.each do |k,v|
            if v.all? {|item| item == "X" || item == "O"}
                isTrue += 1
            end
        end
        return true if isTrue == 3
    end
    
    def player_1_selection
        i = 0
        while i < 1
            temp = @player_1.selection
            if @board[:"row #{temp[0]}"][(temp[1].to_i) - 1] != '-'
                p "Please select empty space..."
            else
                break
            end
        end
        @board[:"row #{temp[0]}"][(temp[1].to_i) - 1] = @player_1.icon
    end
    
    def player_2_selection
        i = 0
        while i < 1
            temp = @player_2.selection
            if @board[:"row #{temp[0]}"][(temp[1].to_i) - 1] != '-'
                p "Please select empty space..."
            else
                break
            end
        end
        @board[:"row #{temp[0]}"][(temp[1].to_i) - 1] = @player_2.icon
    end
    
    def check_win
        @board.each do |key,value| #checks horizontal wins
            if value.all? {|item| item == "X" && item != "-"}
                p "There's a winner!"
                p "#{key} across and the Player X"
                @player_1.wins += 1
                @player_2.losses += 1
                return
            
            elsif value.all? {|item| item == "O" && item != "-"}
                p "There's a winner!"
                p "#{key} across and the Player O"
                @player_2.wins += 1
                @player_1.losses += 1
                return
            end
        end
        

        i = 0    #checks vertical wins
        while i < 3    
            if @board[:"row A"][i] == "-"
                i += 1
                next
            end
                
            if @board[:"row A"][i] == @board[:"row B"][i] && @board[:"row A"][i] == @board[:"row C"][i]
                p "We have a vertical winner...player #{@board[:"row A"][i]}!"
                if @board[:"row A"][i] == "X"
                    @player_1.wins += 1
                    @player_2.losses += 1
                else
                    @player_2.wins += 1
                    @player_1.losses += 1
                end
                return
            else
                i += 1
            end
        end
        
        if @board[:"row B"][1] != "-" #checks diagonal wins
            if @board[:"row A"][0] == @board[:"row B"][1] && @board[:"row C"][2] == @board[:"row B"][1]
                p "We have a diagonal winner...player #{@board[:"row B"][1]}!"
                if @board[:"row B"][1] == "X"
                    @player_1.wins += 1
                    @player_2.losses += 1
                else
                    @player_2.wins += 1
                    @player_1.losses += 1
                end
                return
            elsif @board[:"row A"][2] == @board[:"row B"][1] && @board[:"row C"][0] == @board[:"row B"][1]
                p "We have a diagonal winner...player #{@board[:"row B"][1]}!"
                return
            end
        end
        p "There's no winner yet, keep playing..."
    end
    
    def play_round
        draw_board
        i = 0
        while i < 25
            player_1_selection
            draw_board
            check_win
            if @player_1.wins == 1
                p "player 1 wins! Play again..."
                reset
            elsif @player_2.wins == 1
                p "Player 2 wins! Play again..."
                reset
            elsif stalemate_check == true
                p "stalemate, play again..."
                reset
            end
            
            player_2_selection
            draw_board
            check_win
            if @player_1.wins == 1
                p "player 1 wins! Play again..."
                reset
            elsif @player_2.wins == 1
                p "Player 2 wins! Play again..."
                reset
            elsif stalemate_check == true
                p "stalemate, play again..."
                reset
            end
        end
    end
end #class Game end

game_1 = Game.new
game_1.play_round