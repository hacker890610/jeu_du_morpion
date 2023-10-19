class Game
    attr_accessor :players, :board
  
    def initialize(players = [])
      @players = players
    end
  
    def check_board
      @players.each do |player|
        return player if verify_winner(player, selected_board_case_by_player)
      end
      false
    end
  
    def selected_board_case_by_player
      board_case_by_player = @board.board_cases.group_by(&:player)
      board_case_by_player.delete(false)
      board_case_by_player
    end
  
    def verify_winner(player, board_case_by_player)
      [verify_diagonal_a1_b2_c3(player),
       verify_diagonal_a3_b2_c1(player),
       verify_column(player, board_case_by_player),
       verify_row(player, board_case_by_player)].any?
    end
  
    def verify_diagonal_a1_b2_c3(player)
      diagonal_a1_b2_c3 = [@board.board_cases[0], @board.board_cases[4], @board.board_cases[8]].all? do |board_case|
        board_case.player == player
      end
      diagonal_a1_b2_c3 ? true : false
    end
  
    def verify_diagonal_a3_b2_c1(player)
      diagonal_a3_b2_c1 = [@board.board_cases[6], @board.board_cases[4], @board.board_cases[2]].all? do |board_case|
        board_case.player == player
      end
      diagonal_a3_b2_c1 ? true : false
    end
  
    def verify_column(player, board_case_by_player)
      board_case_by_player_and_column = board_case_by_player[player].group_by(&:column)
  
      (1..3).each do |column|
        next if board_case_by_player_and_column[column].nil?
        return true if board_case_by_player_and_column[column].length == 3
      end
      false
    end
  
    def verify_row(player, board_case_by_player)
      board_case_by_player_and_row = board_case_by_player[player].group_by(&:row)
  
      %w[A B C].each do |row|
        next if board_case_by_player_and_row[row].nil?
        return true if board_case_by_player_and_row[row].length == 3
      end
      false
    end
  end