# frozen_string_literal: true

# Game class
class Game

  attr_accessor :player1, :player2, :board, :active_player

  def initialize
    @board = Board.new
    @player1 = Player.new('Player1', '🔴')
    @player2 = Player.new('Player2', '🔵')
    @active_player = player1
  end

  def yourmove
    puts "Please enter your column #{active_player.name}"
    column = gets.chomp.to_i - 1
    valid = false
    until valid
      if board.valid_move?(column)
        valid = true
      else
        puts 'Invalid - try again'
        column = gets.chomp.to_i - 1
      end
    end
    column
  end

  def play
    puts 'Welcome to Connect 4'
    puts
    puts 'Player 1 will start, please enter your name'
    player1.name = gets.chomp
    puts 'Player 2, what is your name?'
    player2.name = gets.chomp

    win = false
    until win
      board.to_s
      move = yourmove
      board.make_move(move, active_player.token)
      win = board.win?(active_player.token)
      break if win
      player1 == active_player ? self.active_player = player2 : self.active_player = player1
    end
    board.to_s
    puts "The winner is #{active_player.name}"
  end

end
