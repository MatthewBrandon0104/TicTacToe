class User
    
    def initialize
    end

    def make_play
        p "made play"
    end
end

def draw_board
    board = [["-","-","-"],["-","-","-"],["-","-","-"]]
    board.each do |x|
        p x
    end
end

draw_board