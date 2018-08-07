class User
    attr_reader :icon
    @@counter = 0
    
    def initialize
        @icon = "X" if @@counter == 0
        @icon = "O" if @@counter > 0
        @@counter += 1
    end
    
    def selection
        i = 0
        while i < 1
            p "#{self} make a selection..."
            temp = gets.chomp.downcase
            if temp.length != 2
                p "Error, input must be 2 characters..."
            elsif (["a","b","c"].include? (temp[0])) == false
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
        "row B": ["X","O","O"],
        "row C": ["X","-","O"]
        }
    end

    def draw_board
        @board.each do |key, value|
            p value
        end
    end
    
    def check_win
        @board.each do |key,value| #checks horizontal wins
            if value.all? {|item| item == "X"}
                p "There's a winner!"
                p "#{key} across and the Player X"
                return
            
            elsif value.all? {|item| item == "O"}
                p "There's a winner!"
                p "#{key} across and the Player O"
                return
            end
        end
        

        i = 0    #checks vertical wins
        while i < 3    
            if @board[:"row A"][i] == @board[:"row B"][i] && @board[:"row A"][i] == @board[:"row C"][i]
                p "We have a vertical winner...player #{@board[:"row A"][i]}!"
                return
            else
                i += 1
            end
        end
        
        if @board[:"row B"][1] != "-" #checks diagonal wins
            if @board[:"row A"][0] == @board[:"row B"][1] && @board[:"row C"][2] == @board[:"row B"][1]
                p "We have a diagonal winner...player #{@board[:"row B"][1]}!"
                return
            elsif @board[:"row A"][2] == @board[:"row B"][1] && @board[:"row C"][0] == @board[:"row B"][1]
                p "We have a diagonal winner...player #{@board[:"row B"][1]}!"
                return
            end
        end
        
        p "There's no winner this round..."
    end
    
    def play_round
        draw_board
        check_win
    end
end

game_1 = Game.new
game_1.play_round
    
=begin
#How to change and iterate through each has key/array
board.each do |k,v|
        if k == :"row A"
        i = 0
        v.each do |item|
            board[k][i] = "Z"
            i += 1
        end
    end
end
=end