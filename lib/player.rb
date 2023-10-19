class Player
    attr_accessor :name, :symbol
  
    def initialize(name, symbol)
      @name = name
      @symbol = symbol
    end
  
    def select_a_board_case(board, row, column)
      index_of_selected_board_case = board.board_cases.find_index do |board_case|
        board_case.row == row && board_case.column == column
      end
      if board.board_cases[index_of_selected_board_case].player == false
        return board.board_cases[index_of_selected_board_case].player = self
      else
        false
   end
    end
  end