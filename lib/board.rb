class Board
    attr_accessor :board_cases
  
    def initialize
      @board_cases = []
      create_board_cases
    end
  
    def create_board_cases
      column_index = 1
      (1..9).each do |index|
        case index % 3
        when 1
          row = 'A'
          column = column_index
        when 2
          row = 'B'
          column = column_index
        when 0
          row = 'C'
          column = column_index
          column_index += 1
        end
  
        @board_cases << BoardCase.new(index, row, column)
      end
    end
  
    def get_symbol(index)
      if @board_cases[index].player == false
        ' '
      else
        @board_cases[index].player.symbol
      end
    end
  end


            
            
            
            
            
            
            
            