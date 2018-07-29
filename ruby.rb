class User
    attr_reader :icon
    @@counter = 0
    
    def initialize
        @icon = "X" if @@counter == 0
        @icon = "O" if @@counter > 0
        @@counter += 1
    end
    
    def make_selection
        p "Make a selection"
        return gets.chomp
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
    
    def play_round
        draw_board
        p player_1.icon
        p player_2.icon
    end
end

game_1 = Game.new
game_1.play_round