class Application
    attr_accessor :game, :show
  
    def initialize; end
  
    def start_game
      @show = Show.new
      @show.presentation
      players = @show.players_inscription
      player1 = Player.new(players[0], 'X')
      player2 = Player.new(players[1], 'O')
      @game = Game.new([player1, player2])
      launch_game
    end
  
    def launch_game
      @game.board = Board.new
      turn = 1
      loop do
        @game.players.each do |player|
          check_winner(turn) if turn >= 5
          verify_entry(player, turn)
  
          if turn == 9
            @show.draw
            restart_or_quit
          end
  
          turn += 1
          system 'clear'
        end
      end
    end
  
    def verify_entry(player, turn)
      choice = false
      checked = false
      while choice == false
        @show.all_board(@game.board)
        choice = @show.choose_board_case(player.name, turn)
  
        if choice != false
          checked = player.select_a_board_case(@game.board, choice[0], choice[1])
        end
  
        choice = false if checked == false
        @show.wrong_entry if checked == false
      end
      choice
    end
  
    def check_winner(turn)
      check_winner = @game.check_board
      if check_winner != false
        @show.winner(check_winner.name, turn)
        restart_or_quit
      end
    end
  
    def restart_or_quit
      play_again_choice = @show.play_again
      start_game if play_again_choice == 'R'
      exit if play_again_choice == 'Q'
    end
  end






       