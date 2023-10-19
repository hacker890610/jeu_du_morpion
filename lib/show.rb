class Show
    def presentation
      system 'clear'
      print "Un premier joueur dessine son symbole sur une case.
      Puis c'est au tour de l'autre joueur de dessiner son symbole sur une case vide.
      Le but du jeu est de réussir à aligner ses trois symboles, on remporte alors la partie.\n\n"
    end
  
    def players_inscription
      puts 'Quel est le nom du premier joueur'
      print '> '
      player1_user_name = gets.chomp
  
      puts "Tu auras pour symbole la 'X'"
      sleep(0.3)
      puts 'Quel est le nom du deuxieme joueur'
      print '> '
      player2_user_name = gets.chomp
  
      puts "Tu auras pour symbole le 'O'"
      sleep(0.5)
      system 'clear'
      puts "Bienvenue #{player1_user_name} et #{player2_user_name}"
      [player1_user_name, player2_user_name]
    end
  
    def all_board(board)
      cells = '   ' + '-' * 19 + "\n" \
      '   ' + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + "\n" \
      ' A ' + '|' + "  #{board.get_symbol(0)}  " + '|' + "  #{board.get_symbol(3)}  " + '|' + "  #{board.get_symbol(6)}  " + '|' + "\n" \
      '   ' + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + "\n" \
      '   ' + '-------------------' + "\n" \
      '   ' + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + "\n" \
      ' B ' + '|' + "  #{board.get_symbol(1)}  " + '|' "  #{board.get_symbol(4)}  " + '|' + "  #{board.get_symbol(7)}  " + '|' + "\n" \
      '   ' + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + "\n" \
      '   ' + '-------------------' + "\n" \
      '   ' + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + "\n" \
      ' C ' + '|' + "  #{board.get_symbol(2)}  " + '|' "  #{board.get_symbol(5)}  " + '|' + "  #{board.get_symbol(8)}  " + '|' + "\n" \
      '   ' + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + "\n" \
      '   ' + '-------------------' + "\n" \
      '   ' + '   1   ' + '  2   ' + '  3   ' + "\n"
      print cells
    end
  
    def choose_board_case(player_name, turn)
      puts '=============='
      puts "Tour #{turn}"
      puts '=============='
      puts "#{player_name} choisi une case en entrant sa ligne suivi de sa colonne"
      puts 'exemple : B4' if turn == 1
      print '> '
      player_choice = gets.chomp
  
      limited_choice = /^[a-cA-C]{1}[1-3]{1}$/
  
      if player_choice.length == 2 && player_choice =~ limited_choice
        return [player_choice[0].upcase, player_choice[1].to_i]
      end
      false
    end
  
    def wrong_entry
      puts '*******# ERREUR MAUVAISE SAISIE #******* '
      sleep(1)
      puts `clear`
    end
  
    def winner(player_name, turn)
      puts "BRAVO #{player_name} ! TU AS GAGNE ! EN #{turn} TOUR !"
     end
  
    def draw
      puts 'PAS DE GAGNANT QUE DES LOOSERS :)'
    end
  
    def play_again
      choice = ''
      loop do
        puts "\n"
        puts 'Appuyer sur la touche "r" pour rejouer ou "q" pour quitter'
        choice = gets.chomp.upcase
        break if choice == 'R' || choice == 'Q'
      end
      choice
    end
  end