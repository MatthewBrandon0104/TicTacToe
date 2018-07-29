class User
    
    def initialize
    end

    def make_play
        p "made play"
    end
end

def draw_board
    board = {
        "rowA": [0,0,0],
        "rowB": [0,0,0],
        "rowC": [0,0,0]
        }
    
    board.each do |x,y|
        p "#{x} : #{y}"
    end
end

draw_board