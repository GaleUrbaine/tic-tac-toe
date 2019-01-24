require_relative 'player.rb' #On fait appel aux fichiers relatifs
require_relative 'board.rb'

class Game
  def initialize #On met en place la partie en reprenant les données rentrées par l'utilisateur
    puts "*"*71
    p "Salut, bienvenue dans notre superbe morpion!"
    p "Quel est le nom du premier joueur ?"
    print " >"
    name_player_1 = gets.chomp
    p "Ok #{name_player_1}, vous avez les pions X durant cette partie."
    player_symbol_1 = "X"
    @player_1 = Player.new(name_player_1, player_symbol_1)
    p "On va maintenant prendre le nom du second joueur !"
    print " >"
    name_player_2 = gets.chomp
    p "Merci #{name_player_2}, sans surprise... vous avez les pions O."
    puts "*"*71
    player_symbol_2 = "O"
    @player_2 = Player.new(name_player_2, player_symbol_2)
    @players = [@player_1, @player_2]
    @object_board = Board.new
  end

  def perform #Schématisation des valeurs à indiquer pour placer ses pions
    puts "---> Alors... <---"
    puts
    puts "Voici ici le schéma des numéros qu'il faudra indiquer pour placer vos pions : "
    puts
    puts "  1 | 2 | 3 "
    puts "-------------"
    puts "  4 | 5 | 6 "
    puts "-------------"
    puts "  7 | 8 | 9 "
    puts
    puts "*"*71
    puts "Allez, on lance la partie !"
    puts "C'est le moment de parier! Une bière par exemple..."
    puts "*"*71
    puts
    self.turn
  end

  def turn #On initialise les parties
      turns = 0
    while @object_board.victory? == false do #Se relance tant qu'un joueur n'est pas vainqueur
      @players.each{ |player| #On itère sur chaque joueur placé dans l'array @players
        @object_board.display_board #On affiche le tableau
        #p turns
        p "================= TOUR #{turns + 1} =================" #On affiche le tour
        p "#{player.name} ! Où voulez-vous placer votre pion ?"   #On demande une case à l'utilisateur
        p "Indiquez-nous une valeur comprise entre 1 et 9 (cf schéma) :"
        n = gets.chomp.to_i   #On enregistre la case dans la variable n
         # On lui retire 1 pour qu'elle corresponde à un index
          until n > 0 && n < 10
            puts "Désolé, on ne prend pas en compte cette réponse."
            puts "Pouvez-vous renseigner une nouvelle valeur ?"
            n = gets.chomp.to_i
          end
          n = n - 1
        @info_player = [player.name, player.player_symbol, n]
        @object_board.play(@info_player)
        #puts @object_board.victory?

        if @object_board.victory?
          @object_board.display_board
          puts
          puts "---------------------------------------------------------------"
          puts " Eh ben bravo #{player.name},t'as gagné !"
          puts "---------------------------------------------------------------"
          puts "Voulez-vous votre revanche (Pensez au pari...) ?(Y or N)"
          print " =>"
          answer = gets.chomp
          if answer == "Y"
            Game.new.perform
          else
            puts "Ok, alors à plus tard! Revenez-vite."
          end
          break #On casse la boucle
        end

      turns += 1 # On incrémente turns ici

      if turns == 9 #On sort de la boucle quand le tableau est complet
        @object_board.display_board
        puts "---------------------------------------------------------------"
        puts "   Eh beeeeen... Il semblerait que vous ayez fait égalité! "
        puts "---------------------------------------------------------------"
        puts
        puts
        puts "On retente ? (Y or N)"
        print " =>"
        answer = gets.chomp
        if answer == "Y"
          Game.new.perform
        else
          puts "Tchou!"
        end
        break
      end
      }
    end #Fin de boucle While
  end
end
